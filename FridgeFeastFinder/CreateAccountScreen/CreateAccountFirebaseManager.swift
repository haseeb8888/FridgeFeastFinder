//
//  CreateAccountFirebaseManager.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 11/27/23.
//

import UIKit
import Foundation
import FirebaseAuth

extension CreateAccountViewController {
    
    func createNewAccount() {
        // showActivityIndicator()
        
        guard let name = createAccountView.textFieldName.text, !name.isEmpty else {
            showErrorAlert(message: "Name must not be empty!")
            return
        }
        
        guard let email = createAccountView.emailTextField.text, !email.isEmpty else {
            showErrorAlert(message: "Email must not be empty!")
            return
        }
        
        // Check for valid email
        if !isValidEmail(email) {
            showErrorAlert(message: "Enter a Valid Email")
            return
        }
        
        guard let password1 = createAccountView.passwordTextField.text, !password1.isEmpty else {
            showErrorAlert(message: "Password must not be empty!")
            return
        }
        
        guard let password2 = createAccountView.confirmPasswordTextField.text, !password2.isEmpty else {
            showErrorAlert(message: "Password must not be empty!")
            return
        }
        
        if !isValidPassword(password1, confirmPassword: password2) {
            showErrorAlert(message: "Passwords do not match!")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password1, completion: {result, error in
            if error == nil{
                //MARK: the user creation is successful...
                self.setNameOfTheUserInFirebaseAuth(name: name)
                self.showErrorAlert(message: "User Created Successfully")
            }else{
                //MARK: there is a error creating the user...
                self.showErrorAlert(message: error.debugDescription)
                print(error)
            }
        })
        
        
        
    }
    
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                
                //MARK: hide the progress indicator...
                self.hideActivityIndicator()
                
                //MARK: pop the current controller...
                self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String, confirmPassword: String) -> Bool {
        
        // Check if passwords are the same
        guard password == confirmPassword else {
            return false
        }

        // Check if password length is greater than 6
        guard password.count > 6 else {
            return false
        }

        return true
    }
    
    func showErrorAlert(message: String?){
        let alert = UIAlertController(
            title: "Error!", message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
}

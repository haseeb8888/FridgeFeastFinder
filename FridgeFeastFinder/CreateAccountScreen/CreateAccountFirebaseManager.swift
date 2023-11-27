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
            }else{
                //MARK: there is a error creating the user...
                showErrorAlert(message: error.debugDescription)
                print(error!)
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
                let dashBoardViewController = DashBoardViewController()
                dashBoardViewController.navigationItem.hidesBackButton = true
                self.navigationController?.pushViewController(dashBoardViewController, animated: true)
                // self.navigationController?.popViewController(animated: true)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
    
}

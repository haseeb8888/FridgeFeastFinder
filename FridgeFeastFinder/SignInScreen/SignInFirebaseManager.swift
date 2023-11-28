//
//  SignInFirebaseManager.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 11/27/23.
//

import Foundation
import FirebaseAuth

extension SignInViewController {
    
    func signInToFireBase(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
            if error == nil{
                let tabBarVC = FFFTabBarController()
                tabBarVC.navigationItem.hidesBackButton = true;
                self.navigationController?.pushViewController(tabBarVC, animated: true)
            }else{
                showErrorAlert(message: error.debugDescription)
                print(error!)
            }
            
        })
    }
    
}

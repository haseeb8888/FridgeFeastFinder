//
//  SignInViewController.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 11/21/23.
//

import UIKit

class SignInViewController: UIViewController {

    let signInView = SignInView()
    
    override func loadView() {
        view = signInView
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        signInView.loginButton.addTarget(self, action: #selector(onLoginTapped), for: .touchUpInside)
    }
    
    @objc func onLoginTapped(){
        guard let email = signInView.emailTextField.text, !email.isEmpty else {
            showErrorAlert(message: "Email must not be empty!")
            return
        }
        
        guard let password = signInView.passwordTextField.text, !password.isEmpty else {
            showErrorAlert(message: "Password must not be empty!")
            return
        }
        signInToFireBase(email: email, password: password)
    }

}

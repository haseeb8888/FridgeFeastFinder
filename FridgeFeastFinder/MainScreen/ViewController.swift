//
//  ViewController.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 11/16/23.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.loginButton.addTarget(self, action: #selector(onButtonSignInTapped), for: .touchUpInside)
        mainView.createAccButton.addTarget(self, action: #selector(onButtonCreateAccTapped), for: .touchUpInside)
        
    }
    
    @objc func onButtonSignInTapped() {
        let signInViewController = SignInViewController()
        navigationController?.pushViewController(signInViewController, animated: true)
        
    }
    
    @objc func onButtonCreateAccTapped() {
        let createAccountViewController = CreateAccountViewController()
        navigationController?.pushViewController(createAccountViewController, animated: true)

    }


}


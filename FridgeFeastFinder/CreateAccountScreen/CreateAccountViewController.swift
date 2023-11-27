//
//  CreateAccountViewController.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 11/21/23.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    let createAccountView = CreateAccountView()
    
    let childProgressView = ProgressSpinnerViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = createAccountView
        createAccountView.createAccButton.addTarget(self, action: #selector(onCreateAccTapped), for: .touchUpInside)

    }
    
    @objc func onCreateAccTapped(){
        //MARK: creating a new user on Firebase...
        createNewAccount()
    }
    

}

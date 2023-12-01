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

        hideKeyboardOnTapOutside()
    }
    
    @objc func onCreateAccTapped(){
        //MARK: creating a new user on Firebase...
        createNewAccount()
    }
    
    //MARK: hide keyboard logic...
    func hideKeyboardOnTapOutside(){
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    

}

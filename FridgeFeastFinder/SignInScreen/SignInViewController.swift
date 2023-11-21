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
    }

}

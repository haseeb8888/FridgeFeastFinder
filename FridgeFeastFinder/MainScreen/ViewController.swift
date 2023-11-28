//
//  ViewController.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 11/16/23.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    let mainView = MainView()
    let tabBarVC = FFFTabBarController()

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.loginButton.addTarget(self, action: #selector(onButtonSignInTapped), for: .touchUpInside)
        mainView.createAccButton.addTarget(self, action: #selector(onButtonCreateAccTapped), for: .touchUpInside)

        // Check if the user is logged in using Firebase Authentication
//        if let currentUser = Auth.auth().currentUser {
//            print("User is logged in with UID: \(currentUser.uid)")
//            showTabBar()
//        } else {
//            print("User is not logged in")
//            showMainView()
//        }
    }

    @objc func onButtonSignInTapped() {
        let signInViewController = SignInViewController()
        navigationController?.pushViewController(signInViewController, animated: true)
    }

    @objc func onButtonCreateAccTapped() {
        let createAccountViewController = CreateAccountViewController()
        navigationController?.pushViewController(createAccountViewController, animated: true)
    }

    func showTabBar() {
            navigationController?.setViewControllers([self, tabBarVC], animated: true)
        }

        func showMainView() {
            navigationController?.setViewControllers([self], animated: true)
        }
}


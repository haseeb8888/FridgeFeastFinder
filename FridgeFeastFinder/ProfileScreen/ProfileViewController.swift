//
//  ProfileViewController.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 11/28/23.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    let profileView = ProfileView()
    
    override func loadView() {
        view = profileView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "power"), style: .plain, target: self, action: #selector(onLogoutTapped))

    }
    
    @objc func onLogoutTapped(){
        logoutFirebase()
    }
    
    func logoutFirebase() {
        print("triggered")
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
            do{
                try Auth.auth().signOut()
                guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else { return }
                // Call the function to reset the window's rootViewController
                sceneDelegate.showMainApp()
            }catch{
                showErrorAlert(message: error.localizedDescription)
                print("Error occured!")
            }
        })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        self.present(logoutAlert, animated: true)
    }
    

}

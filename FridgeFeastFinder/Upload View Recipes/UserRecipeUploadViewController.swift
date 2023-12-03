//
//  UserRecipeUploadViewController.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 12/2/23.
//

import UIKit

class UserRecipeUploadViewController: UIViewController {
    
    let userRecipeUploadView = UserRecipeUploadView()
    
    override func loadView() {
        view = userRecipeUploadView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

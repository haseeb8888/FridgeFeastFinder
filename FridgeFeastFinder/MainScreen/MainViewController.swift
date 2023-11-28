//
//  MainViewController.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 11/28/23.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

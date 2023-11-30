//
//  RecipeInstructionsViewController.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-30.
//

import UIKit

class RecipeInstructionsViewController: UIViewController {
    
    let recipeInstructionsScreen = RecipeInstructionsView()
    
    override func loadView() {
        view = recipeInstructionsScreen
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        recipeInstructionsScreen.backButton.addTarget(self, action: #selector(onBackButtonTapped), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    

    @objc func onBackButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
}

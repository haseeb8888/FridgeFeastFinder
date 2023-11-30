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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

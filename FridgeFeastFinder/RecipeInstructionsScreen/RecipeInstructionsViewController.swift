//
//  RecipeInstructionsViewController.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-30.
//

import UIKit
import Alamofire

class RecipeInstructionsViewController: UIViewController {
    
    let recipeInstructionsScreen = RecipeInstructionsView()
    
    let childProgressView = ProgressSpinnerViewController()
    
    var recipe: RecipeInstructionResponse?
    var id: Int?
    
    override func loadView() {
        view = recipeInstructionsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipe Instructions: "
        recipeInstructionsScreen.sourceButton.addTarget(self, action: #selector(onSourceClicked), for: .touchUpInside)
        self.showActivityIndicator()
        if let id = self.id {
            getRecipes(id: id)
        }
        self.hideActivityIndicator()
        // Do any additional setup after loading the view.
    }
    
    @objc func onSourceClicked() {
        if let sourceURL = URL(string: recipe!.sourceUrl) {
                UIApplication.shared.open(sourceURL)
            }
    }
    
    
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}


//
//  RecipeInstructionsViewController.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-30.
//

import UIKit

class RecipeInstructionsViewController: UIViewController {
    
    let recipeInstructionsScreen = RecipeInstructionsView()
    
    var recipe: FindByIngredientsResponse?
    
    override func loadView() {
        view = recipeInstructionsScreen
        
        if let recipe = recipe {
            fetchRecipeInstructions(recipeId: recipe.id)
        }
    }

    func fetchRecipeInstructions(recipeId: Int){
        let url = URL(string: APIConfigs.baseURL + "/recipes/extract")!
        URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let recipeDetails = try decoder.decode(FindByIngredientsResponse.self, from: data)
                
                print(recipeDetails)
            } catch {
                print("Error decoding JSON: \(error)")
            }
            
        }.resume()
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

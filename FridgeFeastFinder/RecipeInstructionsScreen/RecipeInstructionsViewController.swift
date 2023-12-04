//
//  RecipeInstructionsViewController.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-30.
//

import UIKit

class RecipeInstructionsViewController: UIViewController {
    
    let recipeInstructionsScreen = RecipeInstructionsView()
   // let sourceUrl = String
    
    var recipe: FindByIngredientsResponse?
    var dataArray = [RecipeInstructionResponse]()
    
    
    override func loadView() {
        view = recipeInstructionsScreen
        
        if let recipe = recipe {
            // fetchRecipeInstructions(recipeUrl: recipe.sourceUrl)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipe Instructions: "
        recipeInstructionsScreen.backButton.addTarget(self, action: #selector(onBackButtonTapped), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @objc func onBackButtonTapped(){
        navigationController?.popViewController(animated: true)
    }
    
    
    func fetchRecipeInstructions(recipeUrl: String){
        let apiKey = APIConfigs.apiKey
        let baseURL = APIConfigs.baseURL + APIConfigs.recipeProcedure
        var components = URLComponents(string: baseURL)
        components?.queryItems = [
            URLQueryItem(name:"url", value: recipeUrl),
            URLQueryItem(name: "forceExtraction", value: "true"),
            URLQueryItem(name:"analyse", value: "false"),
            URLQueryItem(name: "includeNutrition", value: "false"),
            URLQueryItem(name: "includeTaste", value: "false"),
            URLQueryItem(name: "apiKey", value: apiKey)
            
        ]
        
        guard let url = components?.url else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
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
                let recipeDetails = try decoder.decode(RecipeInstructionResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.dataArray.append(recipeDetails)
                    self.updateUI(with: recipeDetails)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
            
        }.resume()
    }
    
    func updateUI(with recipeDetails: RecipeInstructionResponse){
        recipeInstructionsScreen.titleLabel.text = recipeDetails.recipe.title
        
        DispatchQueue.global().async {
            if let imageURL = URL(string: recipeDetails.recipe.image),
               let imageData = try?Data(contentsOf: imageURL),
               let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.recipeInstructionsScreen.imageView.image = image
                }
            }
        }
    }
}
    

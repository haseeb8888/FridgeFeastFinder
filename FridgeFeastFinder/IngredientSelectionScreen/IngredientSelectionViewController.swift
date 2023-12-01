//
//  IngredientSelectionViewController.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit
import Alamofire

class IngredientSelectionViewController: UIViewController, UITextFieldDelegate {
    
    let ingredientSelectionView = IngredientSelectionView()
    
    
    override func loadView() {
        view = ingredientSelectionView
        ingredientSelectionView.findRecipesButton.addTarget(self, action: #selector(onFindRecipesButtonTapped), for: .touchUpInside)
        // so that user input for ingredient is captured and we can delegate to the display recipes screen
        ingredientSelectionView.textFieldSearch.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "What's in your fridge?"
        
        //MARK: reset button definition
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Reset",
            image: UIImage(systemName: "eraser"),
            target: self,
            action: #selector(onResetBarButtonTapped)
        )
    }

    
    //MARK: add a new contact call: add endpoint...
    func addANewIngredient(ingredient: Ingredient){
        let endpoint = "/food/ingredients/autocomplete"
        if let url = URL(string: APIConfigs.baseURL + endpoint){
            
            AF.request(url, method:.get, parameters:
                        [
                            "ingredent": ingredient.ingredient
                        ])
                .responseString(completionHandler: { response in
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...
                                
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
        }else{
            //alert that the URL is invalid...
        }
    }
    
    @objc func onResetBarButtonTapped(){
        
    }
    
    @objc func onFindRecipesButtonTapped(){
        
        let displayRecipesViewController = DisplayRecipesViewController()
        displayRecipesViewController.searchText = ingredientSelectionView.textFieldSearch.text
        self.navigationController?.pushViewController(displayRecipesViewController, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField)->Bool{
        textField.resignFirstResponder()
        return true
    }
    
}

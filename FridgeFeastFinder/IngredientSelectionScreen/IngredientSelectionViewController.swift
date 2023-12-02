//
//  IngredientSelectionViewController.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit
import Alamofire

class IngredientSelectionViewController: UIViewController {
    
    let ingredientSelectionView = IngredientSelectionView()
    
    var ingredients = [Ingredient]()
    
    
    
    override func loadView() {
        view = ingredientSelectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ingredients"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(onPlusButtonTapped)
        )
    }
    
    @objc func onPlusButtonTapped(){
        
    }
    
}
 

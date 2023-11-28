//
//  IngredientSelectionViewController.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit

class IngredientSelectionViewController: UIViewController {
    
    let ingredientSelectionView = IngredientSelectionView()
    
    override func loadView() {
        view = ingredientSelectionView
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
    
    @objc func onResetBarButtonTapped(){
        
    }
    
    
    
}

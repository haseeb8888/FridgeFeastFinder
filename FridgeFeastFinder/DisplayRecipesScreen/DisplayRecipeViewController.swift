//
//  DisplayRecipeViewController.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit

class DisplayRecipesViewController: UIViewController {
    
    let displayRecipesScreen = DisplayRecipesView()
    var searchText: String?

    
    override func loadView() {
        view = displayRecipesScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        displayRecipesScreen.tableViewRecipes.separatorStyle = .none
        
        displayRecipesScreen.backButton.addTarget(self, action: #selector(onBackButtonTapped), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    

    @objc func onBackButtonTapped(){
        navigationController?.popViewController(animated: true)
    }

}

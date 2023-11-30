//
//  RecipeInstructionsView.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-30.
//

import UIKit

class RecipeInstructionsView: UIView {
    
    // when a cell is tapped in the table on the  display recipes screen, we navigate to this page with the instructions for the recipe.

    var backButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        setupBackButton()
        initConstraints()
    }
    
    func setupBackButton() {
        backButton = UIButton(type: .system)
        backButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = .black
        backButton.layer.cornerRadius = 8
        backButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(backButton)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            // backButton.topAnchor.constraint(equalTo: tableViewRecipes.bottomAnchor, constant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//
//  IngredientSelectionView.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit

class IngredientSelectionView: UIView {
    
    var textFieldSearch:UITextField!
    var findRecipesButton: UIButton!
    var tableViewSuggestions: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .systemBackground
        setupTextFieldSearch()
        setupFindRecipesButton()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func setupTextFieldSearch(){
        textFieldSearch = UITextField()
        textFieldSearch.placeholder = "Search"
        textFieldSearch.borderStyle = .roundedRect
        textFieldSearch.keyboardType = .default
        textFieldSearch.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldSearch)
    }
    
    func setupFindRecipesButton(){
        findRecipesButton = UIButton(type: .system)
        findRecipesButton.titleLabel?.font = .boldSystemFont(ofSize: 20)
        findRecipesButton.setTitle("Find Recipes", for: .normal)
        findRecipesButton.setTitleColor(.white, for: .normal)
        findRecipesButton.backgroundColor = .black
        findRecipesButton.layer.cornerRadius = 8
        findRecipesButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(findRecipesButton)
    }
    
    func initConstraints(){
        
        let margins = self.layoutMarginsGuide
        NSLayoutConstraint.activate([
            
            textFieldSearch.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20),
            textFieldSearch.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20),
            textFieldSearch.topAnchor.constraint(equalTo: margins.topAnchor, constant: 20),
            textFieldSearch.heightAnchor.constraint(equalToConstant: 50),
            
            findRecipesButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 20),
            findRecipesButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -20),
            findRecipesButton.topAnchor.constraint(equalTo: textFieldSearch.bottomAnchor, constant: 40),
            findRecipesButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

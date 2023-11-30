//
//  DisplayRecipeView.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit

class DisplayRecipesView: UIView {
    
    var tableViewRecipes: UITableView!
    var backButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        setupTableViewContacts()
        setupBackButton()
        initConstraints()
    }
    
    func setupTableViewContacts(){
        tableViewRecipes = UITableView()
        tableViewRecipes.register(RecipesTableViewCell.self, forCellReuseIdentifier: "recipes")
        tableViewRecipes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewRecipes)
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
    
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewRecipes.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewRecipes.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewRecipes.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewRecipes.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            backButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            backButton.topAnchor.constraint(equalTo: tableViewRecipes.bottomAnchor, constant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

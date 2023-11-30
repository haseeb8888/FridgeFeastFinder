//
//  DisplayRecipeView.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit

class DisplayRecipesView: UIView {
    
    var tableViewRecipes: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initializing a TableView...
        setupTableViewContacts()
        initConstraints()
    }
    
    func setupTableViewContacts(){
        tableViewRecipes = UITableView()
        tableViewRecipes.register(RecipesTableViewCell.self, forCellReuseIdentifier: "recipes")
        tableViewRecipes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewRecipes)
    }
    
    //MARK: setting the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            tableViewRecipes.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewRecipes.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewRecipes.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewRecipes.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

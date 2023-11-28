//
//  RecipesTableViewCell.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit

import UIKit

class RecipesTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var recipeName: UILabel!
    var listOfIngredients: UILabel!
    var recipeImage: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupRecipeNameLabel()
        setupIngredientList()
        setupRecipeImage()
        
        initConstraints()
        
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupWrapperCellView(){
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupRecipeNameLabel(){
        recipeName = UILabel()
        recipeName.font = UIFont.boldSystemFont(ofSize: 14)
        recipeName.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(recipeName)
    }
    
    func setupIngredientList(){
        // needs to get the recipes from the recipes selected from the ingredient selection screen
    
    }
    
    func setupRecipeImage(){
        
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
            
            
        ])
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

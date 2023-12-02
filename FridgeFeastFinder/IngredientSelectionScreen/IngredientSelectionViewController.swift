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
        
        ingredientSelectionView.tableViewIngredients.dataSource = self
        ingredientSelectionView.tableViewIngredients.delegate = self
    }
    
    @objc func onPlusButtonTapped(){
        showAddIngredientAlert()
    }
    
    func showAddIngredientAlert(){
        let alert = UIAlertController(title: "New Ingredient", message: "Enter a name for this ingredient", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "Name"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            if let textField = alert.textFields?.first, let ingredientName = textField.text, !ingredientName.isEmpty {
                let newIngredient = Ingredient(ingredientName: ingredientName)
                self?.ingredients.append(newIngredient)
                self?.ingredientSelectionView.tableViewIngredients.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(saveAction)
        
        present(alert, animated: true, completion: nil)
    }
}
 
extension IngredientSelectionViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: returns the number of rows in the current section...
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    //MARK: populate a cell for the currecnt row...
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredients", for: indexPath) as! IngredientSelectionTableViewCell
        cell.ingredientName.text = ingredients[indexPath.row].ingredientName
        cell.deleteButton.tag = indexPath.row
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonTapped( _:)), for: .touchUpInside)
        return cell
    }
    
    @objc func deleteButtonTapped(_ sender: UIButton){
        let index = sender.tag
        
        let alert = UIAlertController(title: "Delete Ingredient", message: "Are you sure you want to delete this ingredient?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .destructive) { [weak self] _ in
            self?.ingredients.remove(at: index)
            self?.ingredientSelectionView.tableViewIngredients.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.ingredients[indexPath.row])
    }
    
    
}


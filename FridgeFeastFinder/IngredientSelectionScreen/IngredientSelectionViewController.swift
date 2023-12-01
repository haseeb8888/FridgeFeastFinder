//
//  IngredientSelectionViewController.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit
import Alamofire

class IngredientSelectionViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    
    let ingredientSelectionView = IngredientSelectionView()
    var autocompleteResults: [String] = [] // array to store autocomplete suggestions
    
    
    override func loadView() {
        view = ingredientSelectionView
        ingredientSelectionView.findRecipesButton.addTarget(self, action: #selector(onFindRecipesButtonTapped), for: .touchUpInside)
        // so that user input for ingredient is captured and we can delegate to the display recipes screen
        ingredientSelectionView.textFieldSearch.delegate = self
        ingredientSelectionView.tableViewSuggestions.dataSource.self
        ingredientSelectionView.tableViewSuggestions.delegate = self
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
    
    @objc func onFindRecipesButtonTapped(){
        
        let displayRecipesViewController = DisplayRecipesViewController()
        displayRecipesViewController.searchText = ingredientSelectionView.textFieldSearch.text
        self.navigationController?.pushViewController(displayRecipesViewController, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)->Bool{
        let updatedText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? ""
        
        getAutocompleteSuggestions(for: updatedText)
        
        return true
        
    }
    
    
    
    //MARK: add a new contact call: add endpoint...
    func getAutocompleteSuggestions(for query: String){
        let endpoint = "/food/ingredients/autocomplete"
        if let url = URL(string: APIConfigs.baseURL + endpoint){
            
            AF.request(url, method:.get, parameters:
                        [
                            "query": query
                        ])
            .responseJSON{ response in
                switch response.result {
                case.success(let data):
                    if let suggestions = self.parseAutocompleteResponse(data){
                        self.autocompleteResults = suggestions
                        self.ingredientSelectionView.tableViewSuggestions.reloadData()
                    }
                case .failure(let error):
                    print("Autocomplete API request failed due to the following error: \(error)")
                }
            }
        }
    }
    
    func parseAutocompleteResponse(_ data: Any) -> [String]? {
        return nil
    }
            
            
            
            //MARK: Table Views aspects for loading search suggestions
            
            func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                let selectedIngredient = autocompleteResults[indexPath.row]
                ingredientSelectionView.textFieldSearch.text = selectedIngredient
                textFieldShouldReturn(ingredientSelectionView.textFieldSearch)
            }
            
            
            
            func textFieldShouldReturn(_ textField: UITextField)->Bool{
                textField.resignFirstResponder()
                return true
            }
            
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return autocompleteResults.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "autocompleteCell", for: indexPath)
                cell.textLabel?.text = autocompleteResults[indexPath.row]
                return cell
            }
            
            
        }
    

//
//  IngredientSelectionView.swift
//  FridgeFeastFinder
//
//  Created by Katherine Davis on 2023-11-27.
//

import UIKit

class IngredientSelectionView: UIView {
    
    var contentScroller:UIScrollView!
    var textFieldSearch:UITextField!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.backgroundColor = .systemBackground
        setupContentScroller()
        setupTextFieldSearch()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContentScroller(){
        contentScroller = UIScrollView()
        contentScroller.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentScroller)
    }
    
    func setupTextFieldSearch(){
        textFieldSearch = UITextField()
        textFieldSearch.placeholder = "Search"
        textFieldSearch.borderStyle = .roundedRect
        textFieldSearch.keyboardType = .default
        textFieldSearch.translatesAutoresizingMaskIntoConstraints = false
        contentScroller.addSubview(textFieldSearch)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            contentScroller.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentScroller.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentScroller.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentScroller.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            
        ])
    }

}

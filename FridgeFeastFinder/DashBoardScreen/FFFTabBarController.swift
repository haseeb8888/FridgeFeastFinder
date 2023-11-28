//
//  FFFTabBarController.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 11/28/23.
//

import UIKit
import FirebaseAuth

class FFFTabBarController: UITabBarController {
    let isLoggedIn = Auth.auth().currentUser != nil

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().backgroundColor = .systemBackground
        viewControllers = [createRecipesNC(), createBookmarksNC(), createProfileNC()]
        
        // Trigger the function in BookmarksVC when the app starts
//        if let bookmarksNavVC = viewControllers?[2] as? UINavigationController,
//           let bookmarksVC = bookmarksNavVC.viewControllers.first as? BookmarksVC {
//            bookmarksVC.fetchBookmarkedRecipeIDs()
//        }
    }
    
    
    func createBookmarksNC() -> UINavigationController {
        let homeVC = DashBoardViewController()
        homeVC.title = "Bookmarks"
        homeVC.tabBarItem = UITabBarItem(title: "Bookmarks", image: UIImage(systemName: "bookmark.fill"), tag: 1)
        
        return UINavigationController(rootViewController: homeVC)
    }
    
 
    func createRecipesNC() -> UINavigationController  {
        let recipesVC = IngredientSelectionViewController()
        recipesVC.title = "MY FRIDGE"
        recipesVC.tabBarItem = UITabBarItem(title: "Fridge", image: UIImage(systemName: "refrigerator"), tag: 0)
        
        return UINavigationController(rootViewController: recipesVC)
    }
    
    func createProfileNC() -> UINavigationController  {
        let viewController: UIViewController
            viewController = ProfileViewController()

        viewController.title = "View Profile"
        viewController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 2)

        return UINavigationController(rootViewController: viewController)
    }
}

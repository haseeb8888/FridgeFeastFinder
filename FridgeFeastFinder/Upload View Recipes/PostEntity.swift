//
//  PostEntity.swift
//  FridgeFeastFinder
//
//  Created by Haseeb Hussain on 12/2/23.
//

import Foundation

class PostEntity {
    
    var email : String
    var comment : String
    var imageUrl : String
    
    
    init(email : String, comment : String, imageUrl : String){
        self.email = email
        self.comment = comment
        self.imageUrl = imageUrl
    }
}

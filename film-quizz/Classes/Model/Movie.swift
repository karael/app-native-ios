//
//  Movie.swift
//  film-quizz
//
//  Created by Paul Gabriel on 06/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation

class Movie {
    var title: String!
    var illuPath: String!
    var id: String!
    var firstHint: String!
    var secondHint: String!
    var thirdHint: String!
    
    
    init(){
        
    }
    
    init(title: String, releaseDate: String){
        self.title = title
    }
}
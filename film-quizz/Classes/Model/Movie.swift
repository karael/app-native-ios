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
    var releaseDate: String!
    var excerpt: String!
    var posterPath: String!
    var id: String!
    var actors: [Actor]!
    
    init(){
        
    }
    
    init(title: String, releaseDate: String){
        self.title = title
        self.releaseDate = releaseDate
    }
}
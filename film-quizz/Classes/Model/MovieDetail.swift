//
//  MovieDetail.swift
//  film-quizz
//
//  Created by Paul Gabriel on 07/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation

class MovieDetail {
    
    var id: String!
    var name: String!
    var excerpt: String!
    var posterPath: String!
    var actors: [Actor]!
    var hint1: String!
    var hint2: String!
    var hint3: String!
    
    
    init(){
        
    }
    
    init(id: String, name: String, excerpt: String, posterPath: String, actors: [Actor], hint1: String, hint2: String, hint3: String){
        self.id = id
        self.name = name
        self.excerpt = excerpt
        self.posterPath = posterPath
        self.actors = actors
        self.hint1 = hint1
        self.hint2 = hint2
        self.hint3 = hint3
    }
    
}
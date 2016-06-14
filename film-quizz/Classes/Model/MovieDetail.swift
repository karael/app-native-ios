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
    var coverPath: String!
    var actors: [Actor]!
    var genre: String!
    var releaseDate: String!
    
    init(){
        
    }
    
    init(id: String, name: String, excerpt: String, coverPath: String, actors: [Actor], genre: String, releaseDate: String){
        self.id = id
        self.name = name
        self.excerpt = excerpt
        self.coverPath = coverPath
        self.actors = actors
        self.genre = genre
        self.releaseDate = releaseDate

    }
    
}
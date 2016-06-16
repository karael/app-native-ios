//
//  Actor.swift
//  film-quizz
//
//  Created by Paul Gabriel on 06/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation

class Actor {
    var name: String!
    var role: String!
    var poster: String!
    
    init(){
        
    }
    
    init(name: String, role:String){
        self.name = name
        self.role = role
    }
}
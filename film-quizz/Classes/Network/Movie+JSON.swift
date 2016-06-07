//
//  Movie+JSON.swift
//  film-quizz
//
//  Created by Paul Gabriel on 07/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Movie {
    
    convenience init (json : JSON){
        self.init()
        
        self.id = json["id"].stringValue
        self.excerpt = json["excerpt"].stringValue
        self.title = json["title"].stringValue
        self.posterPath = json["poster_path"].stringValue
        self.releaseDate = json["release_date"].stringValue
        
    }
    
}

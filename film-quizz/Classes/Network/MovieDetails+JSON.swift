//
//  MovieDetails+JSON.swift
//  film-quizz
//
//  Created by Paul Gabriel on 15/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation
import SwiftyJSON

extension MovieDetail {
    
    convenience init (json : JSON){
        self.init()
        
        self.id = json["_id"].stringValue
        self.title = json["title"].stringValue
        self.coverPath = json["cover"].stringValue
        self.genre = json["genres"][0]["name"].stringValue
        self.excerpt = json["overview"].stringValue
        self.releaseDate = json["release_date"].stringValue.characters.split("T").map(String.init)[0]
    }
}
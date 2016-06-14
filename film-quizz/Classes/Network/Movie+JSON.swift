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
        
        self.id = json["_id"].stringValue
        self.title = json["title"].stringValue
        self.illuPath = json["illu"].stringValue
        self.firstHintType = json["index_1"].stringValue.characters.split(";").map(String.init)[0]
        self.firstHint = json["index_1"].stringValue.characters.split(";").map(String.init)[1]
        self.secondHintType = json["index_2"].stringValue.characters.split(";").map(String.init)[0]
        self.secondHint = json["index_2"].stringValue.characters.split(";").map(String.init)[1]
        self.thirdHintType = json["index_3"].stringValue.characters.split(";").map(String.init)[0]
        self.thirdHint = json["index_3"].stringValue.characters.split(";").map(String.init)[1]
        
    }
    
}
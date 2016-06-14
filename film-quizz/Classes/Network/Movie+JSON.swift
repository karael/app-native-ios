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
        self.firstHint = json["index_1"].stringValue
        self.secondHint = json["index_2"].stringValue
        self.thirdHint = json["index_3"].stringValue
        
    }
    
}

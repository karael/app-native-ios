//
//  Actor+JSON.swift
//  film-quizz
//
//  Created by Paul Gabriel on 16/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Actor {
    
    convenience init(json: JSON) {
        self.init()
        
        self.name = json["name"].stringValue
        self.role = json["character"].stringValue
        self.poster = UrlBuilder.getActorPictureUrl(json["profile_path"].stringValue)
    }
}
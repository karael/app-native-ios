//
//  UrlBuilder.swift
//  film-quizz
//
//  Created by Paul Gabriel on 07/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation

class UrlBuilder {
    
    static var apibase = "apibase"
    
    static func gameMoviesUrl() -> String {
        let url = "\(apibase)"
        
        return url
    }
    
    static func successMoviesUrl() -> String {
        let url = "\(apibase)"
        
        return url
    }
    
    static func singleMovieUrl(id: String) -> String {
        let url = "\(apibase)/api/movie/\(id)"
        
        return url
    }
    
    static func posteUrl(posterPath: String) -> String{
        let url = "\(apibase)/\(posterPath)"
        
        return url
    }
    
    static func detailMovieUrl(movieId: Int) -> String {
        let url = "\(apibase)/\(movieId)"
        
        return url
    }
    
}

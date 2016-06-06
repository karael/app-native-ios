//
//  UrlBuilder.swift
//  film-quizz
//
//  Created by Paul Gabriel on 07/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation

class UrlBuilder {
    
    static let apiIdentity = NSUUID().UUIDString
    
    static func getGameMovies() -> String {
        let url = "apibase."
    }
    
    static func searchMovieUrl(title: String) -> String{
        let url = "http://api.themoviedb.org/3/search/movie?api_key=\(apiKey)&query=\(title)"
        
        return url
        
    }
    
    static func posteUrl(posterPath: String) -> String{
        let url = "https://image.tmdb.org/t/p/w130\(posterPath)"
        
        return url
    }
    
    static func detailMovieUrl(movieId: Int) -> String {
        let url = "http://api.themoviedb.org/3/movie/\(movieId)?api_key=\(apiKey)&language=fr"
        
        return url
    }
    
}

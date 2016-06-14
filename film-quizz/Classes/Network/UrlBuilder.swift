//
//  UrlBuilder.swift
//  film-quizz
//
//  Created by Paul Gabriel on 07/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation

class UrlBuilder {
    
    static var apibase = "http://163.172.29.197:3000"
    
    static func retrieveUserUrl(UUID: String) -> String {
        let url = "\(apibase)/api/user/\(UUID)"
        return url
    }
    
    static func createUserUrl(UUID: String) -> String {
        let url = "\(apibase)/api/user"
        return url
    }
    
    static func gameMoviesUrl() -> String {
        let url = "\(apibase)/api/movies/state"
        return url
    }
    
    static func successMoviesUrl() -> String {
        let url = "\(apibase)/api/movies/success"
        return url
    }
    
    static func singleMovieUrl(id: String) -> String {
        let url = "\(apibase)/api/movie/\(id)"
        return url
    }
    
    static func illuUrl(illuPath: String) -> String {
        let url = "\(apibase)/assets/illus/\(illuPath)"
        return url
    }
    
    static func posteUrl(posterPath: String) -> String{
        let url = "\(apibase)/\(posterPath)"
        return url
    }
    
    static func thumbnailUrl(thumbnailUrl: String) -> String{
        let url = "\(apibase)/\(thumbnailUrl)"
        return url
    }
    
    static func detailMovieUrl(movieId: Int) -> String {
        let url = "\(apibase)/api/movie/\(movieId)"
        return url
    }
    
}

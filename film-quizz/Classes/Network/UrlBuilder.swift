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
    
    static func createUserUrl() -> String {
        let url = "\(apibase)/api/user"
        return url
    }
    
    static func gameMoviesUrl() -> String {
        let url = "\(apibase)/api/movies/state"
        return url
    }
    
    static func successListUrl() -> String {
        let url = "\(apibase)/api/movies/success"
        return url
    }
    
    static func singleMovieUrl(id: String) -> String {
        let url = "\(apibase)/api/movie/\(id)"
        return url
    }
    
    static func detailMovieUrl(movieId: Int) -> String {
        let url = "\(apibase)/api/movie/\(movieId)"
        return url
    }
    
    static func postScoreUrl() -> String {
        let url = "\(apibase)/api/score"
        return url
    }
    
    static func getActorsUrl(movieId: String) -> String {
        let url = "\(apibase)/api/movie/\(movieId)/cast"
        return url
    }
    
    static func getActorPictureUrl(fileName: String) -> String {
        let url = "http://image.tmdb.org/t/p/original/\(fileName)"
        return url
    }
    
    static func getRelatedListUrl(movieId: String) -> String {
        let url = "\(apibase)/api/movie/\(movieId)/related"
        return url
    }
}

//
//  MovieManager.swift
//  film-quizz
//
//  Created by Paul Gabriel on 06/06/16.
//  Copyright © 2016 Paul Gabriel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class MovieManager {
    
    static let apiIdentity = NSUUID().UUIDString

    
    typealias GameMovies = (movies: [Movie]) -> Void
    typealias resultMovieDetail = (movieDetail: MovieDetail) -> Void
    
    static let headers = [
        "X-app-UUID": apiIdentity,
        "Content-Type": "application/json"
    ]
    
    static func getGameMovies(gameMovies: GameMovies) {
        
        let gameMoviesUrl = UrlBuilder.gameMoviesUrl()
        print(gameMoviesUrl)
        print(apiIdentity)
        
        Alamofire.request(.GET, gameMoviesUrl, headers: headers).responseJSON{ (response) in
        
            var movies = [Movie]()
 
            if let json = response.result.value as? [String: AnyObject] {
                
                if let results = json["data"] as? [AnyObject]{
                    
                    for result in results {
                        let jsonResult = JSON(result)
                        
                        let movie = Movie(json: jsonResult)
                        movies.append(movie)
                    }
                }
            }
            gameMovies(movies: movies)
        }
    }
    
    static func getDetailsMovie(movieId: String) {
        
//        let getDetailsMovieUrl = UrlBuilder.singleMovieUrl(movieId)
        
//        return getDetailsMovieUrl
    }
}
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
    
    static let apiIdentity : String =  UserManager.apiIdentity

    
    typealias GameMovies = (movie: Movie) -> Void
    typealias resultMovieDetail = (movieDetail: MovieDetail) -> Void
    
    static let headers = [
        "X-app-UUID": apiIdentity,
        "Content-Type": "application/json"
    ]
    
    static func getGameMovies(gameMovies: GameMovies) {
        
        let gameMoviesUrl = UrlBuilder.gameMoviesUrl()
        
        Alamofire.request(.GET, gameMoviesUrl, headers: headers).responseJSON{ (response) in
        
            var movie = Movie()
 
            if let json = response.result.value as? [String: AnyObject] {
                
                let jsonResult = JSON(json)["data"]
                
                movie = Movie(json: jsonResult)
            }
            gameMovies(movie: movie)
        }
    }
    
    func getDetailsMovie(movieId: String) {
        
//        let getDetailsMovieUrl = UrlBuilder.singleMovieUrl(movieId)
        
//        return getDetailsMovieUrl
    }
}
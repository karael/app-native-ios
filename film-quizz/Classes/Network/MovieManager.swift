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

class GameMovieManager {
    
    static let apiIdentity = NSUUID().UUIDString
    
    typealias resultMovie = (movies: [Movie]) -> Void
    typealias resultMovieDetail = (movieDetail: MovieDetail) -> Void
    
    static let headers = [
        "X-app-UUID": apiIdentity
    ]
    
    static func getGameMovies() {
        
        let getMoviesUrl = UrlBuilder.gameMoviesUrl()
        
        Alamofire.request(.GET, getMoviesUrl, headers: headers).responseJSON{ (response) in
        
            var movies = [Movie]()
 
            if let json = response.result.value as? [String: AnyObject] {
                
                if let results = json["data"] as? [AnyObject]{
                    
                    for result in results {
                        let movieId = JSON(result)["id"].stringValue
                        
                        let getSingleMovieUrl = UrlBuilder.singleMovieUrl(movieId)
                        
                        Alamofire.request(.GET, getSingleMovieUrl, headers: headers).responseJSON { (response) in
                            
                            if (response.result.value as? [String:AnyObject]) != nil {
                                if let movieData = json["data"] as? [AnyObject] {
                                    let jsonMovie = JSON(movieData)
                                    let movie = Movie(json: jsonMovie)
                                    
                                    movies.append(movie)
                                }
                            }
                        }
                    }
                }
            }
            resultMovie(movies: movies)
        }
    }
    
    static func getDetailsMovie(movieId: String) {
        
        let getDetailsMovieUrl = UrlBuilder.singleMovieUrl(movieId)
        
        
    }
}
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
    typealias ResultMovieDetail = (movieDetail: MovieDetail) -> Void
    typealias ResultActorsDetail = (actors: [Actor]) -> Void
    typealias RelatedMoviesList = (moviesList: [MovieList]) -> Void
    
    
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
    
    static func getDetailsMovie(movieId: String, resultMovieDetail : ResultMovieDetail) {
        
        let getDetailsMovieUrl = UrlBuilder.singleMovieUrl(movieId)
        
        Alamofire.request(.GET, getDetailsMovieUrl, headers: headers).responseJSON{ (response) in
            
            var movieDetails = MovieDetail()
            
            if let json = response.result.value as? [String: AnyObject] {
                let jsonResult = JSON(json)["data"]
                print(jsonResult["overview"])
                
                movieDetails = MovieDetail(json: jsonResult)
            }
            resultMovieDetail(movieDetail: movieDetails)
        }
    }
    
    static func getActors(movieId: String, resultActorsDetail: ResultActorsDetail) {
        
        let getActorsUrl = UrlBuilder.getActorsUrl(movieId)
        
        Alamofire.request(.GET, getActorsUrl, headers: headers).responseJSON { (response) in
            
            var actorsArray = [Actor]()
            
            if let json = response.result.value as? [String: AnyObject] {
                
                if let data = json["data"] as? [AnyObject] {
                    
                    for result in data {
                        let jsonResult = JSON(result)
                        
                        let actor = Actor(json: jsonResult)
                        actorsArray.append(actor)
                    }
                }
                resultActorsDetail(actors: actorsArray)
            }
        }
    }
    
    static func getRelatedList(movieId: String, relatedMoviesList: RelatedMoviesList) {
        
        let getSuccessList = UrlBuilder.getRelatedListUrl(movieId)
        
        Alamofire.request(.GET, getSuccessList, headers: headers).responseJSON { (response) in
            
            var movieListArray = [MovieList]()
            
            if let json = response.result.value as? [String: AnyObject] {
                
                if let data = json["data"] as? [AnyObject] {
                    
                    for result in data {
                        let jsonResult = JSON(result)
                        
                        let movieList = MovieList(json: jsonResult)
                        movieListArray.append(movieList)
                    }
                }
                relatedMoviesList(moviesList: movieListArray)
            }
        }
    }
}
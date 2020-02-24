//
//  MockMovieAPI.swift
//  MovieAppTests
//
//  Created by Mac  on 2/24/20.
//  Copyright © 2020 com.megatrustgroup.asli. All rights reserved.
//

import UIKit
@testable import MovieApp
class MockMovieAPI {
    var shouldReturnError = false
     var getMoviesCalled = false
    enum MocckServiceError : Error{
         case getMovies
     }
     
     func reset(){
          shouldReturnError = false
           getMoviesCalled = false
     }
     convenience init(){
         self.init(false)
     }
     init(_ shouldReturnError:Bool) {
         self.shouldReturnError = shouldReturnError
     }
    let mockMovieApiResponse = APIResponse(page: 1, totalPages: 500, totalResults: 10000, movies: [Movie(movieTitle: "Sonic the Hedgehog", moviePoster: "/aQvJ5WPzZgYVDrxLX4R6cLJCEaQ.jpg")])

}
extension MockMovieAPI:MovieAPIProtocol{
    func getMovies(page: Int, completion: @escaping ([Movie]?, Error?) -> ()) {
         getMoviesCalled = true
        if shouldReturnError {
            completion(nil,MocckServiceError.getMovies)
        }
        else{
            completion(mockMovieApiResponse.movies, nil)
        }
    }
    
 
}

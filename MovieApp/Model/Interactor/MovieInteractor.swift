//
//  MovieInteractor.swift
//  MovieApp
//
//  Created by Mac  on 2/24/20.
//  Copyright © 2020 com.megatrustgroup.asli. All rights reserved.
//

import UIKit

class MovieInteractor {
    func getMovies(page:Int,completion: @escaping ([Movie]?,Error?)->()){
        APIService().makeRequestForModel(urlParameters: ["page":page] , body:nil ,  apiUrl: URLConstants.getPopularMovies) { (result:Result<APIResponse, NetworkError>) in
            switch result  {
            case .success(let data):
                completion(data.movies,nil)
            case .failure(let error):
                completion(nil , error)
            }
        }
    }
}

//
//  MovieAPI.swift
//  MovieApp
//
//  Created by Mac  on 2/24/20.
//  Copyright © 2020 com.megatrustgroup.asli. All rights reserved.
//

import Foundation
import UIKit

struct APIResponse: Codable,Equatable {
    static func == (lhs: APIResponse, rhs: APIResponse) -> Bool {
        return  true
    }
    
    var page : Int?
    var totalPages:Int?
    var totalResults:Int?
    var movies:[Movie]?
    
    enum CodingKeys: String, CodingKey {
         case page = "page"
         case totalPages = "total_pages"
         case totalResults = "tota_results"
         case movies = "results"
     }
    
}

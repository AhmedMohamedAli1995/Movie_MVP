//
//  Movie.swift
//  MovieApp
//
//  Created by Mac  on 2/24/20.
//  Copyright © 2020 com.megatrustgroup.asli. All rights reserved.
//

import Foundation
import Foundation
struct Movie:Codable{
    var movieTitle:String?
    var moviePoster:String?
    enum CodingKeys: String, CodingKey {
        case movieTitle = "title"
        case moviePoster = "poster_path"
    }
}

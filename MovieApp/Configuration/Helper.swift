//
//  Helper.swift
//  MovieApp
//
//  Created by Mac  on 2/24/20.
//  Copyright © 2020 com.megatrustgroup.asli. All rights reserved.
//

import UIKit

class Helper: NSObject {
    
    class  func queryString(_ value: String, params: [String: Any]) -> String? {
          var components = URLComponents(string: value)
          components?.queryItems = params.map { element in URLQueryItem(name: element.key, value: "\(element.value)") }

          return components?.url?.absoluteString
      }
}

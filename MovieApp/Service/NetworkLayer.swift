//
//  APIService.swift
//  MovieApp
//
//  Created by Mac  on 2/24/20.
//  Copyright © 2020 com.megatrustgroup.asli. All rights reserved.
//

import UIKit


enum NetworkError: Error {
    case noInternet(string: String)
    case network(string: String)
    case parser(string: String)
    case downLoad(string:String)
    case custom(string: String)
    case encoding(string:String)
    var localizedDescription: String {
        switch self {
        case .noInternet(let string):
            return string
        case .network(let string):
            return string
        case .parser(let string):
            return string
        case .downLoad(let string):
            return string
        case .custom(let string):
            return string
        case .encoding(let string):
            return string
        }
    }
    
}

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
}

class APIService: NSObject {
    private let session:URLSession
    
    init(session:URLSession = .shared) {
        self.session = session
    }
    func makeRequestForModel<T:Codable>(urlParameters: [String: Any]?, body:[String:Any]?,method: HTTPMethod = .get,apiUrl: URLConstants, completion:@escaping (_ response:Result<T,NetworkError>)->Void){
        let url = URLConstants.baseURL.rawValue + apiUrl.rawValue
        var param = urlParameters ?? [:]
        param["api_key"] = "191e2ab14461830f06cb5cd2b7ab92ec"
        guard let urlWithQueryParameters = Helper.queryString(url, params: param) else {
            return
        }
        guard let urlRequest = URL(string: urlWithQueryParameters) else {
            return
        }
        var request = URLRequest(url: urlRequest)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if method == .post{
            do{
                if let body = body {
                    request.httpBody =  try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                }
                else{
                    completion(.failure(.encoding(string: "no body found to encode it")))
                }
            }
            catch{
                completion(.failure(.encoding(string: "can't encode body")))
            }
        }
        
        
        
        let _ = self.session.dataTask(with: request) { (data, respons, error) in
            var errorMsg = ""
            if let error = error{
                errorMsg = error.localizedDescription
            }
            if let response = respons as? HTTPURLResponse {
                let status = response.statusCode
                if status > 299 || status < 200 {
                    completion(.failure(.network(string: errorMsg)))
                    return
                }
            }
            guard let jsonData = data else {
                completion(.failure(.parser(string: "No Data found")))
                return
                
            }
            do {
                let jsonmodel = try JSONDecoder().decode(T.self, from: jsonData)
                completion(.success(jsonmodel))
            }
            catch {
                completion(.failure(.parser(string: "No Data found")))
            }
            
        }.resume()
        
        
    }
}

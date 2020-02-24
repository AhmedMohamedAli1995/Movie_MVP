//
//  MovieViewController + MovieViewProtocol .swift
//  Improvement
//
//  Created by Wageh on 2/18/20.
//  Copyright © 2020 AhmedAli. All rights reserved.
//

import Foundation
extension MoviesViewController:MovieViewProtocol{
    func showIndicator() {
        print("showIndicator ")
    }
    
    func hideIndicator() {
        print(hideIndicator)
    }
    
    func getListSuccessfully() {
        print("reload collection here")
    }
    
    func showError(error: String) {
        print("error")
    }
    
    
}


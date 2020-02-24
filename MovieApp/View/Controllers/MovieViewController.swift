//
//  ViewController.swift
//  MovieApp
//
//  Created by Mac  on 2/24/20.
//  Copyright © 2020 com.megatrustgroup.asli. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

     var movieViewModel:MovieViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        movieViewModel = MovieViewModel(movieViewProtocol: self)
        movieViewModel.viewDidLoad()
         // Do any additional setup after loading the view.
    }




}


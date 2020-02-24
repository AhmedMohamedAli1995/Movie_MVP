//
//  MovieViewModel.swift
//  Improvement
//
//  Created by Wageh on 2/18/20.
//  Copyright © 2020 AhmedAli. All rights reserved.
//

import UIKit
protocol MovieViewProtocol:class {
    func showIndicator()
    func hideIndicator()
    func getListSuccessfully()
    func showError(error:String)
    
}

protocol MovieCellViewProtocol {
    func displayImage(imageUrl:String)
    func displayTitle(title:String)
}


class MovieViewModel {
    private weak var movieViewProtocol:MovieViewProtocol?
    private let interactor = MovieInteractor()
    private var movies:[Movie] = []
    
    init(movieViewProtocol:MovieViewProtocol) {
        self.movieViewProtocol = movieViewProtocol
    }
    func viewDidLoad(){
        getMovies(page: 1)
    }
    func getMovies(page:Int){
        //talk with interactor
        movieViewProtocol?.showIndicator()
        interactor.getMovies(page: page) {[weak self] (movies, error) in
            guard let self = self else {return}
            self.movieViewProtocol?.hideIndicator()
            if let error = error {
                self.movieViewProtocol?.showError(error: error.localizedDescription)
            }
            else{
                guard let movies = movies else {return}
                self.movies = movies
                print("self.movies\(self.movies)")
                self.movieViewProtocol?.getListSuccessfully()
            }
        }
        
        
    }
    func getMoviesCount()->Int{
        return movies.count
    }
    func configureMoviewCell(cell:MovieCellViewProtocol,index:Int){
        let movie = movies [index]
        cell.displayImage(imageUrl: movie.moviePoster ?? "")
        cell.displayTitle(title: movie.movieTitle ?? "")
        
    }
}


//
//  MainViewModel.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//
import Foundation
import Combine

@MainActor
class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    private let service: MovieService

    init(service: MovieService) {
        self.service = service
    }

    convenience init() {
        self.init(service: MovieService())
    }
    
    func loadMovies() async {
        do{
            movies = try await service.fetchMovies()
        }catch{
            print(error)
        }
    }
}

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
            guard movies.isEmpty else { return }
            movies = try await service.fetchMovies()
        }catch{
            print(error)
        }
    }
    func toggleFavorite(movie: Movie) {

           guard let index = movies.firstIndex(where: {
               $0.id == movie.id
           }) else { return }

           movies[index].isFavorite.toggle()
       }

       var favoriteMovies: [Movie] {
           movies.filter { $0.isFavorite }
       }
}

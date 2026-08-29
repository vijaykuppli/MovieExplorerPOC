//
//  MovieService.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//
import Foundation

class MovieService {

    func fetchMovies() async throws -> [Movie] {

        return [
            Movie(id: 1, title: "Bahubali"),
            Movie(id: 2, title: "RRR"),
            Movie(id: 3, title: "Pushpa")
        ]
    }
}

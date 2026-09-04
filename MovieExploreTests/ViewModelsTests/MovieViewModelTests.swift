//
//  MovieExploreTests.swift
//  MovieExploreTests
//
//  Created by Vijay Santosh Kumar Kupli on 04/09/26.
//

import XCTest
@testable import MovieExplorer

@MainActor
final class MovieViewModelTests: XCTestCase {

    func testLoadMovies() async {
        // Given
        let viewModel = MovieViewModel()

        // When
        await viewModel.loadMovies()

        // Then
        XCTAssertFalse(viewModel.movies.isEmpty)
    }
    func testToggleFavorite() async {
        // Given
        let viewModel = MovieViewModel()

        // When
        await viewModel.loadMovies()

        let movie = viewModel.movies[0]

        // Then
        XCTAssertFalse(movie.isFavorite)

        // When
        viewModel.toggleFavorite(movie: movie)

        // Then
        XCTAssertTrue(viewModel.movies[0].isFavorite)
    }
    func testFavoriteMovies() async {
        // Given
        let viewModel = MovieViewModel()

        // When
        await viewModel.loadMovies()

        let movie = viewModel.movies[0]
        viewModel.toggleFavorite(movie: movie)

        // Then
        XCTAssertEqual(viewModel.favoriteMovies.count, 1)
        XCTAssertEqual(viewModel.favoriteMovies[0].id, movie.id)
    }
}

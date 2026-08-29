//
//  MovieListView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieViewModel()

        var body: some View {

            NavigationStack {

                List(viewModel.movies) { movie in
                    MovieRowView(movie: movie)
                }
                .navigationTitle("Movies")
                .task {
                    await viewModel.loadMovies()
                }
            }
        }
}

#Preview {
    MovieListView()
}

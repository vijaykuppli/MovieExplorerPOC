//
//  MovieListView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

struct MovieListView: View {
    @Environment(MovieViewModel.self)
    private var viewModel
    
        var body: some View {

            NavigationStack {

                List(viewModel.movies) { movie in

                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieRowView(
                                    movie: movie,
                                    onFavoriteTap: {
                                        viewModel.toggleFavorite(movie: movie)
                                    }
                                )
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
                .navigationTitle("movies_title")
                .task {
                    await viewModel.loadMovies()
                }
            }
        }
}

#Preview {
    MovieListView()
}

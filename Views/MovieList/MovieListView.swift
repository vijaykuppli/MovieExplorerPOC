//
//  MovieListView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

struct MovieListView: View {
    @EnvironmentObject var viewModel: MovieViewModel
    
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

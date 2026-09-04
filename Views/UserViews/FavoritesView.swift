//
//  FavouritesView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 30/08/26.
//

import SwiftUI

struct FavoritesView: View {
    @Environment(MovieViewModel.self)
    private var viewModel
    
    var body: some View {
        NavigationStack {

            Group {

                            if viewModel.favoriteMovies.isEmpty {

                                VStack(spacing: AppConstants.Spacing.medium) {

                                    Image(systemName: "heart.slash")
                                        .font(.system(size: 60))
                                        .foregroundStyle(.secondary)

                                    Text("No Favorites Yet")
                                        .font(.title2)
                                        .fontWeight(.semibold)

                                    Text("Movies you add to your favorites will appear here.")
                                        .font(.subheadline)
                                        .foregroundStyle(.secondary)
                                        .multilineTextAlignment(.center)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)

                            } else {

                                List(viewModel.favoriteMovies) { movie in

                                    MovieRowView(
                                        movie: movie,
                                        onFavoriteTap: {
                                            viewModel.toggleFavorite(movie: movie)
                                        }
                                    )
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color.clear)
                                }
                                .listStyle(.plain)
                            }
                        }
                        .navigationTitle("favorites_title")
                    }
    }
}

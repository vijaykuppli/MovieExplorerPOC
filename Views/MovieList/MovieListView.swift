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

                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieRowView(movie: movie)
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

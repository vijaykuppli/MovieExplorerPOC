//
//  MovieDetailView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 30/08/26.
//

import SwiftUI

struct MovieDetailView: View {

    let movie: Movie

    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 16) {

                AsyncImage(url: URL(string: movie.imageUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 420)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } placeholder: {
                    ProgressView()
                }

                Text(movie.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text(movie.title)
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Text("⭐ \(4.7, specifier: "%.1f")")
                    .font(.title2)

                Text("""
                 A carefree young man named Raja lives with his grandmother and sets out to find his missing or lost grandfather, Kanakaraju. His search leads him to an ancestral royal property and a spooky mansion hiding a dark, sinister family presence and an ancient curse.  His search leads him to an ancestral royal property and a spooky mansion hiding a dark, sinister family presence and an ancient curse.
                """)
                .font(.headline)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

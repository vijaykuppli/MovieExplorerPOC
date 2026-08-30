//
//  MovieRowView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 29/08/26.
//

import SwiftUI

struct MovieRowView: View {

    let movie: Movie
    let onFavoriteTap: () -> Void
    
    var body: some View {

        HStack(spacing: 16) {

            AsyncImage(url: URL(string: movie.imageUrl)) { phase in

                switch phase {

                case .empty:
                    ProgressView()
                        .frame(width: 80, height: 120)

                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 120)

                @unknown default:
                    EmptyView()
                }
            }
            VStack(alignment: .leading, spacing: 8) {

                Text(movie.title)
                    .font(.title3)
                    .fontWeight(.semibold)

                Text("Action • Adventure")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text("⭐ 4.8")
                    .font(.caption)
                    .foregroundStyle(.orange)
            }

            Spacer()
            Button {
                onFavoriteTap()
            } label: {
                Image(
                    systemName: movie.isFavorite
                        ? "heart.fill"
                        : "heart"
                )
                .foregroundStyle(.red)
            }
            .buttonStyle(.borderless)
        }
        .padding()
        .background(movie.backgroundColor.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

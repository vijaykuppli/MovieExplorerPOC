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

        HStack(spacing: AppConstants.Spacing.extraLarge) {

            AsyncImage(url: URL(string: movie.imageUrl)) { phase in

                switch phase {

                case .empty:
                    ProgressView()
                        .frame(width: AppConstants.ViewDimensions.width, height: AppConstants.ViewDimensions.height)

                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: AppConstants.ViewDimensions.height, height: AppConstants.ViewDimensions.height)
                        .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.medium))

                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: AppConstants.ViewDimensions.width, height: AppConstants.ViewDimensions.height)

                @unknown default:
                    EmptyView()
                }
            }
            VStack(alignment: .leading, spacing: AppConstants.Spacing.small) {

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
        .background(backgroundColor.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: AppConstants.CornerRadius.medium))
    }
    private var backgroundColor: Color {
            switch movie.backgroundColor {
            case "red":
                return .red
            case "blue":
                return .blue
            case "green":
                return .green
            case "orange":
                return .orange
            case "purple":
                return .purple
            case "yellow":
                return .yellow
            case "cyan":
                return .cyan
            case "black":
                return .black
            case "brown":
                return .brown
            case "gray":
                return .gray
            case "indigo":
                return .indigo
            case "mint":
                return .mint
            case "pink":
                return .pink
            case "teal":
                return .teal
            case "white":
                return .white
            case "primary":
                return .primary
            case "secondary":
                return .secondary
            default:
                return .clear
            }
        }
}

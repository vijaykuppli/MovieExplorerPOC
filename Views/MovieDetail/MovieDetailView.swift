//
//  MovieDetailView.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 30/08/26.
//

import SwiftUI
import AVKit

struct MovieDetailView: View {

    let movie: Movie
    @State private var showVideoPlayer = false
    
    var body: some View {

        ScrollView {

            VStack(alignment: .leading, spacing: 16) {

                ZStack {

                    AsyncImage(url: URL(string: movie.imageUrl)) { image in
                        image
                            .resizable()
                            .frame(height: AppConstants.ImageSize.imageHeight)
                    } placeholder: {
                        ProgressView()
                    }

                    Button {
                        showVideoPlayer = true
                    } label: {

                        Image(systemName: "play.circle.fill")
                            .font(.system(size: 70))
                            .foregroundStyle(.white)
                            .shadow(radius: AppConstants.CornerRadius.normal)
                    }
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
        .fullScreenCover(isPresented: $showVideoPlayer) {
            VideoPlayerScreen(
                videoUrl: "https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_ts/master.m3u8"
            )
        }
    }
}

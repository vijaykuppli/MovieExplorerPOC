//
//  VideoPlayerScreen.swift
//  MovieExplorer
//
//  Created by Vijay Santosh Kumar Kupli on 30/08/26.
//

import SwiftUI
import AVKit

struct VideoPlayerScreen: View {

    let videoUrl: String

    @State private var player: AVPlayer?
    @Environment(\.dismiss) private var dismiss

    var body: some View {
            ZStack(alignment: .topTrailing) {
                VideoPlayer(player: player)
                    .ignoresSafeArea()
                    .onAppear {
                        guard let url = URL(string: videoUrl) else { return }
                        
                        player = AVPlayer(url: url)
                        player?.play()
                    }
                Button("Done") {
                               dismiss()
                }.padding()
            }
        }
}

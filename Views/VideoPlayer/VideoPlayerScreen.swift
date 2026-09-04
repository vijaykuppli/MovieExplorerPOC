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
    @Environment(\.scenePhase) private var scenePhase

    var body: some View {
        ZStack(alignment: .topTrailing) {

            VideoPlayer(player: player)
                .ignoresSafeArea()
                .onAppear {
                    setupPlayer()
                }
                .onDisappear {
                    cleanupPlayer()
                }

            Button("done") {
                dismiss()
            }
            .padding()
        }
        .onChange(of: scenePhase) { _, newPhase in
            handleScenePhase(newPhase)
        }
    }

    private func setupPlayer() {
        guard let url = URL(string: videoUrl) else {
            return
        }

        let avPlayer = AVPlayer(url: url)
        player = avPlayer
        avPlayer.play()
    }

    private func handleScenePhase(_ phase: ScenePhase) {
        switch phase {
        case .active:
            // App is in foreground
            break

        case .inactive, .background:
            // App moved away from foreground
            player?.pause()

        @unknown default:
            player?.pause()
        }
    }

    private func cleanupPlayer() {
        player?.pause()
        player?.replaceCurrentItem(with: nil)
        player = nil
    }
}

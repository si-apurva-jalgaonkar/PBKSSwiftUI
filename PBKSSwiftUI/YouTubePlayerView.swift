//
//  YouTubePlayerView.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 06/05/25.
//

import SwiftUI
import WebKit
import YouTubeiOSPlayerHelper

struct YouTubePlayerView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    let videoID: String
    
    func makeUIView(context: Context) -> YTPlayerView {
        let playerView = YTPlayerView()
        playerView.delegate = context.coordinator
        
        let playerVars: [String: Any] = [
            "playsinline": 1,
            "autoplay": 1,
            "modestbranding": 1,
            "controls": 1,
            "rel": 0
        ]
        
        playerView.load(withVideoId: videoID, playerVars: playerVars)
        return playerView
    }
    
    func updateUIView(_ uiView: YTPlayerView, context: Context) {
        // No updates needed unless video ID changes
    }
    
    class Coordinator: NSObject, YTPlayerViewDelegate {
        func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
            playerView.playVideo()
        }
    }
}

//#Preview {
//    YouTubePlayerView()
//}

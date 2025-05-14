//
//  VideoPlayerView.swift
//  PBKSSwiftUI
//
//  Created by Apurva Jalgaonkar on 21/06/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    @State private var player = AVPlayer()
    var videoURL: URL
    
    var body: some View {
        
        VideoPlayer(player: player)
                    .frame(height: 280)
                    .onAppear {
                        player.replaceCurrentItem(with: AVPlayerItem(url: videoURL))
                        player.play()
                    }
                    .onDisappear {
                        player.pause()
                    }
        
    }
}

//#Preview {
//    VideoPlayerView()
//}

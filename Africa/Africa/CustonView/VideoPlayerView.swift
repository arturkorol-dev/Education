//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Artur Korol on 07.08.2022.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    //MARK: - Properties
    
    let videoSelected: String
    let videoTitle: String
    
    //MARK: - Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, videoFormat: "mp4")) {
            }
            .overlay(
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 8)
                , alignment: .topLeading
            )
        }
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//MARK: - Preview
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}

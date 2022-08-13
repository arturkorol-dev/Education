//
//  VideoListView.swift
//  Africa
//
//  Created by Artur Korol on 03.08.2022.
//

import SwiftUI

struct VideoListView: View {
    //MARK: - Properties
    
    @State var videos: [Video] = Bundle.main.decode("videos")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            List(videos) { item in
                NavigationLink {
                    VideoPlayerView(videoSelected: item.id, videoTitle: item.name)
                } label: {
                    VideoListItemView(video: item)
                        .padding(.vertical, 8)
                }
            }
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        }
    }
}

//MARK: - Preview

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

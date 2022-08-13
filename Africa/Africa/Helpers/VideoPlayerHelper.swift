//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Artur Korol on 08.08.2022.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, videoFormat: String) -> AVPlayer? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: videoFormat) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer
}

//
//  VideoModel.swift
//  Africa
//
//  Created by Artur Korol on 07.08.2022.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    var thumbnail: String {
        "video-\(id)"
    }
}

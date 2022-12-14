//
//  Follower.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 19.10.2022.
//

import Foundation

struct Follower: Codable, Hashable {
    var login: String
    var avatarUrl: String
}

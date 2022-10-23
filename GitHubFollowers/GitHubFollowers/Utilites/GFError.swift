//
//  GFError.swift
//  GitHubFollowers
//
//  Created by Artur Korol on 23.10.2022.
//

import Foundation

enum GFError: String, Error {
    case invalidUserName = "This username created an invalid request. Please try agin."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}

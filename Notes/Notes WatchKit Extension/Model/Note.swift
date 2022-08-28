//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Artur Korol on 28.08.2022.
//

import Foundation

struct Note: Identifiable, Codable {
    var id: UUID
    var text: String
}


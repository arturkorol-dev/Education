//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Artur Korol on 16.08.2022.
//

import Foundation

struct Category: Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
}

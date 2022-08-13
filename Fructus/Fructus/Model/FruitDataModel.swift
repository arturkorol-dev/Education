//
//  FruitDataModel.swift
//  Fructus
//
//  Created by Artur Korol on 30.07.2022.
//

import SwiftUI

struct FruitDataModel: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
    var description: String
    var nutrition: [String]
}

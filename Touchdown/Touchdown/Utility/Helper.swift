//
//  Helper.swift
//  Touchdown
//
//  Created by Artur Korol on 14.08.2022.
//

import SwiftUI

//Data
let players: [Player] = Bundle.main.decode("player")
let categories: [Category] = Bundle.main.decode("category")
let products: [Product] = Bundle.main.decode("product")
let brands: [Brand] = Bundle.main.decode("brand")
let sampleProduct: Product = products[0]

//Constraint
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    Array(repeating: GridItem(.flexible()), count: 2)
}

//UX
let haptic = UIImpactFeedbackGenerator(style: .medium)

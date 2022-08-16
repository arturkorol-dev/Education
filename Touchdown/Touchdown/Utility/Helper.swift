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

//Constraint
let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
    Array(repeating: GridItem(.flexible()), count: 2)
}

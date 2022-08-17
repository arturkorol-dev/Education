//
//  Shop.swift
//  Touchdown
//
//  Created by Artur Korol on 17.08.2022.
//

import Foundation

class Shop: ObservableObject {
    @Published var showingProducts = false
    @Published var selectedProducts: Product? = nil
}

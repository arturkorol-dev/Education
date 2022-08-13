//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Artur Korol on 04.08.2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: "json") else {fatalError("")}
        
        guard let data = try? Data(contentsOf: url) else {fatalError("")}
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {fatalError("")}
        return loaded
    }
}

//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Artur Korol on 14.08.2022.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: "json") else {
            fatalError("Failed to locate \(file)")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to read \(file)")
        }
        
        let decoder = JSONDecoder()
        
        guard let safeData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file)")
        }
        
        return safeData
    }
}

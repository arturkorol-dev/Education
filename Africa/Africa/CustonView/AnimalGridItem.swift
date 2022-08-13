//
//  AnimalGridItem.swift
//  Africa
//
//  Created by Artur Korol on 13.08.2022.
//

import SwiftUI

struct AnimalGridItem: View {
    let animal: Animal
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridItem_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals")
    static var previews: some View {
        AnimalGridItem(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

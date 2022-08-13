//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Artur Korol on 05.08.2022.
//

import SwiftUI

struct AnimalListItemView: View {
    let animals: Animal
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animals.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(animals.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animals.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals")
    static var previews: some View {
        AnimalListItemView(animals: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  InsetFactsView.swift
//  Africa
//
//  Created by Artur Korol on 07.08.2022.
//

import SwiftUI

struct InsetFactsView: View {
    //MARK: - Properties
    
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }
            .tabViewStyle(.page)
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

//MARK: - Preview
struct InsetFactsView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals")
    
    static var previews: some View {
        InsetFactsView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

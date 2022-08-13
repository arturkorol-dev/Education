//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Artur Korol on 05.08.2022.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: - Properties
    
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            }
        }
    }
}

//MARK: - Preview
struct InsetGalleryView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals")
    
    static var previews: some View {
        InsetGalleryView(animal: animal[0])
    }
}

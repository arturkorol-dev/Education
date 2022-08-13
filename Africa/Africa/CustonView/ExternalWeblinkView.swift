//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Artur Korol on 07.08.2022.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: - Properties
    
    let animal: Animal
    
    //MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!) {
                        Text(animal.name)
                    }
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

//MARK: - Preview
struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals")
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

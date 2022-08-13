//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Artur Korol on 02.08.2022.
//

import SwiftUI

struct SettingsLabelView: View {
    //MARK: - Properties
    let title: String
    let image: String
    
    //MARK: - Body
    var body: some View {
        HStack {
            Text(title.uppercased())
                .font(.body)
                .bold()
            Spacer()
            Image(systemName: image)
        }
    }
}

//MARK: - Preview
struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(title: "Fructus", image: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//
//  TabBarItemView.swift
//  Africa
//
//  Created by Artur Korol on 03.08.2022.
//

import SwiftUI

struct TabBarItemView: View {
    //MARK: - Properties
    var image: String
    var title: String
    
    //MARK: - Body
    var body: some View {
        VStack {
            Image(systemName: image)
            Text(title)
        }
    }
}

//MARK: - Preview
struct TabBarItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItemView(image: "square.grid.2x2", title: "Browse")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

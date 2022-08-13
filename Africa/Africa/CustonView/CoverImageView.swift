//
//  CoverImageView.swift
//  Africa
//
//  Created by Artur Korol on 03.08.2022.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: - Property
    
    let coverImages: [CoverImage] = Bundle.main.decode("covers")
    
    //MARK: - Body
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(.page)
    }
}

//MARK: - Preview

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
    }
}

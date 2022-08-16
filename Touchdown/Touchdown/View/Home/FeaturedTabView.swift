//
//  FeaturedTabView.swift
//  Touchdown
//
//  Created by Artur Korol on 14.08.2022.
//

import SwiftUI

struct FeaturedTabView: View {
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(players) { player in
                FeaturedItemView(players: player)
                    .padding(.top, 10)
                    .padding(.horizontal, 15)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

//MARK: - Preview
struct FeaturedTabView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedTabView()
    }
}

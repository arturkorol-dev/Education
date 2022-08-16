//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Artur Korol on 14.08.2022.
//

import SwiftUI

struct FeaturedItemView: View {
    //MARK: - Properties
    let players: Player
    
    //MARK: - Body
    var body: some View {
        Image(players.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

//MARK: - Preview
struct FeaturedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItemView(players: players[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

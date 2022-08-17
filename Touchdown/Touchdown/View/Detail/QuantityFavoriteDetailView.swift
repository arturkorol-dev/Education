//
//  QuantityFavoriteDetailView.swift
//  Touchdown
//
//  Created by Artur Korol on 17.08.2022.
//

import SwiftUI

struct QuantityFavoriteDetailView: View {
    //MARK: - Properties
    @State var counter = 0
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            Button {
                haptic.impactOccurred()
                if counter > 0 {
                    counter -= 1
                }
            } label: {
                Image(systemName: "minus.circle")
            }
            
            Text("\(counter)")
                .fontWeight(.semibold)
                .frame(minWidth: 36)
            
            Button {
                haptic.impactOccurred()
                if counter < 100 {
                    counter += 1
                }
            } label: {
                Image(systemName: "plus.circle")
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "heart.circle")
                    .foregroundColor(.pink)
            }
        }
        .font(.system(.title, design: .rounded))
        .foregroundColor(.black)
        .imageScale(.large)
    }
}

//MARK: - Preview
struct QuantityFavoriteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuantityFavoriteDetailView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

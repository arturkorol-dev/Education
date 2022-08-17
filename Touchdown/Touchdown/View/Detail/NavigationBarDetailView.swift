//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Artur Korol on 17.08.2022.
//

import SwiftUI

struct NavigationBarDetailView: View {
    //MARK: - Properties
    @EnvironmentObject var shop: Shop
    
    //MARK: - Body
    var body: some View {
        HStack {
            Button {
                haptic.impactOccurred()
                withAnimation (.easeIn) {
                    shop.showingProducts = false
                    shop.selectedProducts = nil
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "cart")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }
    }
}

//MARK: - Preview
struct NavigationBarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray)
    }
}

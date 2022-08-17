//
//  AddToCartDetailView.swift
//  Touchdown
//
//  Created by Artur Korol on 17.08.2022.
//

import SwiftUI

struct AddToCartDetailView: View {
    //MARK: - Properties
    @EnvironmentObject var shop: Shop
    //MARK: - Body
    var body: some View {
        Button {
            haptic.impactOccurred()
        } label: {
            Spacer()
            Text("Add to cart".uppercased())
                .font(.system(.title2, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
        }
        .padding(15)
        .background(
            Color(
                red: shop.selectedProducts?.red ?? sampleProduct.red,
                green: shop.selectedProducts?.green ?? sampleProduct.green,
                blue: shop.selectedProducts?.blue ?? sampleProduct.blue
            )
        )
        .clipShape(Capsule())
    }
}

//MARK: - Preview
struct AddToCartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AddToCartDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

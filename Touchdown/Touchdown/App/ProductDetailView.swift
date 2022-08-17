//
//  ProductDetailView.swift
//  Touchdown
//
//  Created by Artur Korol on 16.08.2022.
//

import SwiftUI

struct ProductDetailView: View {
    //MARK: - Properties
    @EnvironmentObject var shop: Shop
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 5, content: {
            //NavBar
            NavigationBarDetailView()
                .padding(.horizontal)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            //Header
            HeaderDetailView()
                .padding(.horizontal)
            //DetailTopPart
            TopPartDetailView()
                .padding(.horizontal)
                .zIndex(1)
            //DetailBottomPart
            VStack(alignment: .center, spacing: 0) {
                //Ratings + Size
                RatingSizeDetailView()
                    .padding(.top, -20)
                    .padding(.bottom, 10)
                //Description
                ScrollView(.vertical, showsIndicators: false) {
                    Text(shop.selectedProducts?.description ?? sampleProduct.description)
                        .font(.system(.body, design: .rounded))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
                //Quantity + favorite
                QuantityFavoriteDetailView()
                    .padding(.vertical, 10)
                //Add to cart
                AddToCartDetailView()
                    .padding(.bottom, 20)
                
                Spacer()
            }
            .padding(.horizontal)
            .background(
                Color.white
                    .clipShape(CustomShape())
                    .padding(.top, -105)
            )
        })
        .zIndex(0)
        .ignoresSafeArea(.all, edges: .all)
        .background(
            Color(
                red: shop.selectedProducts?.red ?? sampleProduct.red,
                green: shop.selectedProducts?.green ?? sampleProduct.green,
                blue: shop.selectedProducts?.blue ?? sampleProduct.blue
            )
            .ignoresSafeArea(.all, edges: .all)
        )
    }
}

//MARK: - Preview
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView()
            .environmentObject(Shop())
    }
}

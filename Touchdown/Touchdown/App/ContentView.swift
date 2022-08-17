//
//  ContentView.swift
//  Touchdown
//
//  Created by Artur Korol on 14.08.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @EnvironmentObject var shop: Shop
    
    //MARK: - Body
    var body: some View {
        ZStack {
            if !shop.showingProducts && shop.selectedProducts == nil {
                VStack(spacing: 0) {
                    navigationBar
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 0) {
                            FeaturedTabView()
                                .padding(.vertical, 20)
                                .frame(height: UIScreen.main.bounds.width / 1.5)
                            CategoryGridView()
                            helmets
                            brands
                            FooterView()
                                .padding(.horizontal)
                        }
                    }
                }
                .background(Color.mainBackground.ignoresSafeArea(.all, edges: .all))
            } else {
                ProductDetailView()
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
    
    //MARK: - View
    private var navigationBar: some View {
        NavigationBarView()
            .padding(.horizontal, 15)
            .padding(.bottom)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(.white)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
    
    private var helmets: some View {
        VStack {
            TitleView(title: "Helmets")
            
            LazyVGrid(columns: gridLayout, spacing: 15) {
                ForEach(products) { product in
                    ProductItemView(product: product)
                        .onTapGesture {
                            haptic.impactOccurred()
                            
                            withAnimation(.easeOut) {
                                shop.selectedProducts = product
                                shop.showingProducts = true
                            }
                        }
                }
            }
            .padding(15)
        }
    }
    
    private var brands: some  View {
        VStack {
            TitleView(title: "Brands")
            BrandGridView()
        }
    }
}
//MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Shop())
    }
}

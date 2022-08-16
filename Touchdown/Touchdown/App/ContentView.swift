//
//  ContentView.swift
//  Touchdown
//
//  Created by Artur Korol on 14.08.2022.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties

    
    //MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                NavigationBarView()
                    .padding(.horizontal, 15)
                    .padding(.bottom)
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(.white)
                    .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 5)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        FeaturedTabView()
                            .padding(.vertical, 20)
                            .frame(height: UIScreen.main.bounds.width / 1.5)
                        
                        CategoryGridView()
                        
                        TitleView(title: "Helmets")
                        
                        LazyVGrid(columns: gridLayout, spacing: 15) {
                            ForEach(products) { product in
                                ProductItemView(product: product)
                            }
                        }
                        .padding(15)
                        
                        FooterView()
                            .padding(.horizontal)
                        
                    }
                }
            }
            .background(Color.mainBackground.ignoresSafeArea(.all, edges: .all))
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

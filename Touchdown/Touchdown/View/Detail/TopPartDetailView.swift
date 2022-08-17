//
//  TopPartDetailView.swift
//  Touchdown
//
//  Created by Artur Korol on 17.08.2022.
//

import SwiftUI

struct TopPartDetailView: View {
    //MARK: - Properties
    @State var isAnimated = false
    @EnvironmentObject var shop: Shop
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 6) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Price")
                    .fontWeight(.semibold)
                
                Text(shop.selectedProducts?.formattedPrice ?? sampleProduct.formattedPrice)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .scaleEffect(1.35, anchor: .leading)
            }
            .offset(y: isAnimated ? -50 : -75)
            
            Spacer()
            
            Image(shop.selectedProducts?.image ?? sampleProduct.image)
                .resizable()
                .scaledToFit()
                .offset(y: isAnimated ? 0 : -35)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.75)) {
                isAnimated.toggle()
            }
        }
    }
}

//MARK: - Preview
struct TopPartDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TopPartDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

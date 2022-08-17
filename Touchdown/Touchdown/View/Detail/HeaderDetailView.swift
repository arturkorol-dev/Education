//
//  HeaderDetailView.swift
//  Touchdown
//
//  Created by Artur Korol on 17.08.2022.
//

import SwiftUI

struct HeaderDetailView: View {
    //MARK: - Properties
    @EnvironmentObject var shop: Shop
    
    //MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Protective Gear")
            
            Text(shop.selectedProducts?.name ?? sampleProduct.name)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .foregroundColor(.white)
    }
}

//MARK: - Preview
struct HeaderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderDetailView()
            .environmentObject(Shop())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

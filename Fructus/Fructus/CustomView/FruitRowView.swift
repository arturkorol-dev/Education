//
//  FruitRowView.swift
//  Fructus
//
//  Created by Artur Korol on 31.07.2022.
//

import SwiftUI

struct FruitRowView: View {
    //MARK: - Property -
    var fruit: FruitDataModel
    
    //MARK: - Body -
    var body: some View {
        HStack {
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(colors: fruit.gradientColors, startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(fruit.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(fruit.headline)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct FruitRowView_Previews: PreviewProvider {
    static var previews: some View {
        FruitRowView(fruit: fruitsData[0])
            .previewLayout(.sizeThatFits)
    }
}

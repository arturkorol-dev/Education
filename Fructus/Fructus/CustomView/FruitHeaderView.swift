//
//  FruitHeaderView.swift
//  Fructus
//
//  Created by Artur Korol on 31.07.2022.
//

import SwiftUI

struct FruitHeaderView: View {
    //MARK: - Properties -
    
    var fruit: FruitDataModel
    @State private var isAnimationImage = false
    
    //MARK: - Body -
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .top, endPoint: .bottom)
            
            
            Image(fruit.image)
                .resizable()
                .scaledToFit()
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                .padding(.vertical, 20)
                .scaleEffect(isAnimationImage ? 1.0 : 0.6)
        }
        .frame(height: 440)
        .onAppear {
            withAnimation(.easeOut(duration: 0.5), {
                isAnimationImage = true
            })
        }
    }
}

//MARK: - Preview -
struct FruitHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        FruitHeaderView(fruit: fruitsData[0])
            .previewLayout(.fixed(width: 375, height: 440))
    }
}

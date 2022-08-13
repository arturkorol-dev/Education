//
//  FruitCardView.swift
//  Fructus
//
//  Created by Artur Korol on 28.07.2022.
//

import SwiftUI

struct FruitCardView: View {
    //MARK: - Properties -
    var fruit: FruitDataModel
    @State private var isAnimated = false
    
    //MARK: - Body -
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image(fruit.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimated ? 1.0 : 0.6)
                
                // Title
                Text(fruit.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                
                // Headline
                Text(fruit.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: 480)
                
                //Button
                StartButtonView()
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5), {
                isAnimated = true
            })
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(
            LinearGradient(gradient: Gradient(colors: fruit.gradientColors), startPoint: .leading, endPoint: .trailing)
        )
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

//MARK: - Preview -
struct FruitCardView_Previews: PreviewProvider {
    static var previews: some View {
        FruitCardView(fruit: fruitsData[1])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}

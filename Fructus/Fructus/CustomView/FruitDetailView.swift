//
//  FruitDetailView.swift
//  Fructus
//
//  Created by Artur Korol on 31.07.2022.
//

import SwiftUI

struct FruitDetailView: View {
    //MARK: - Properties -
    
    var fruit: FruitDataModel
    
    //MARK: - Body -
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    // HEADER
                    FruitHeaderView(fruit: fruit)
                    
                    VStack(alignment: .center, spacing: 20) {
                        // TITLE
                        Text(fruit.title)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // HEADLINE
                        Text(fruit.headline)
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                        // NUTRIENTS
                        FruitNutritionsView(fruit: fruit)
                        
                        // SUBHEADLINE
                        Text("Lern more about \(fruit.title)".uppercased())
                            .fontWeight(.bold)
                            .foregroundColor(fruit.gradientColors[1])
                        
                        // DESCRIPTION
                        Text(fruit.description)
                            .multilineTextAlignment(.leading)
                        
                        //LINK
                        SourceLinkView()
                            .padding(.top, 10)
                            .padding(.bottom, 40)
                    }
                    .padding(.horizontal, 20)
                    .frame(maxWidth: 640, alignment: .center)
                }
                .navigationBarHidden(true)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .navigationViewStyle(.stack)
    }
}

//MARK: - Preview -
struct FruitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FruitDetailView(fruit: fruitsData[0])
    }
}

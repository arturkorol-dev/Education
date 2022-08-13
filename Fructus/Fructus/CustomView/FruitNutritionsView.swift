//
//  FruitNutritionsView.swift
//  Fructus
//
//  Created by Artur Korol on 01.08.2022.
//

import SwiftUI

struct FruitNutritionsView: View {
    //MARK: - Properties -
    
    var fruit: FruitDataModel
    let nutrients = ["Energy", "Sugar", "Fat", "Protein", "Vitamins", "Minerals"]
    
    //MARK: - Body -
    var body: some View {
        GroupBox() {
            DisclosureGroup("Nutritional value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider()
                        .padding(.vertical, 2)
                    
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundColor(fruit.gradientColors[1])
                        .font(.system(.body).bold())
                        
                        Spacer(minLength: 25)
                        
                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

//MARK: - Preview -
struct FruitNutritionsView_Previews: PreviewProvider {
    static var previews: some View {
        FruitNutritionsView(fruit: fruitsData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}

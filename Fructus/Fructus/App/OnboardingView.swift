//
//  OnboardingView.swift
//  Fructus
//
//  Created by Artur Korol on 29.07.2022.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: - Properties
    
    private var fruits = fruitsData
    
    //MARK: - Body
    var body: some View {
        TabView {
            ForEach(fruits[0...5]) { item in
                FruitCardView(fruit: item)
            }
        }
        .tabViewStyle(.page)
        .padding(.vertical, 20)
    }
}

//MARK: - Preview
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

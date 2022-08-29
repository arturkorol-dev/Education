//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Artur Korol on 29.08.2022.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - Properties
    @State private var randomNumber = Int.random(in: 1..<4)
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    
    //MARK: - Body
    var body: some View {
        VStack(spacing: 3) {
            Image(randomImage)
                .resizable()
                .scaledToFit()
            
            HeaderView(title: "Credits")
            
            Text("Artur Korol")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .foregroundColor(.secondary)
                .font(.footnote)
                .fontWeight(.light)
        }
    }
}

//MARK: - Preview
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}

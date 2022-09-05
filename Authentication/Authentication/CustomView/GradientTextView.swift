//
//  GradientTextView.swift
//  Authentication
//
//  Created by Artur Korol on 04.09.2022.
//

import SwiftUI

struct GradientTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .gradientForeground(
                colors: [Color.lavenderGradientColor,
                         Color.pinkGradientColor]
            )
    }
}

struct GradientTextView_Previews: PreviewProvider {
    static var previews: some View {
        GradientTextView(text: "Hello world!")
    }
}

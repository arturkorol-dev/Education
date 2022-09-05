//
//  GradientButtonView.swift
//  Authentication
//
//  Created by Artur Korol on 04.09.2022.
//

import SwiftUI

struct GradientButtonView: View {
    //MARK: - Properties
    
    var action: () -> Void
    
    var buttonGradient: [Color] = [
        Color(red: 101/255, green: 134/255, blue: 1),
        Color(red: 1, green: 64/255, blue: 80/255),
        Color(red: 109/255, green: 1, blue: 185/255),
        Color(red: 39/255, green: 232/255, blue: 1)
    ]
    
    //MARK: - Body
    
    var body: some View {
        Button {
            action()
        } label: {
            GeometryReader { geometry in
                ZStack {
                    AngularGradient(colors: buttonGradient, center: .center, angle: .zero)
                        .blendMode(.overlay)
                        .blur(radius: 8)
                        .mask {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 50)
                                .frame(maxWidth: geometry.size.width - 16)
                                .blur(radius: 8)
                        }
                    GradientTextView(text: "Sign Up")
                        .font(.headline)
                        .frame(width: geometry.size.width - 16,
                               height: 50
                        )
                        .background(Color.tertiaryBackground.opacity(0.9))
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white, lineWidth: 1)
                                .blendMode(.normal)
                                .opacity(0.7)
                        }
                        .cornerRadius(16)
                }
            }
            .frame(height: 50)
        }
    }
}

struct GradientButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GradientButtonView(action: {})
    }
}

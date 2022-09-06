//
//  TextFieldIconView.swift
//  Authentication
//
//  Created by Artur Korol on 05.09.2022.
//

import SwiftUI

struct TextFieldIconView: View {
    var iconName: String
    @Binding var currentlyEditing: Bool
    @State private var colorAngle: Double = 0.0
    
    var body: some View {
        ZStack {
            VisualEffectBlur(blurStyle: .dark) {
                ZStack {
                    if currentlyEditing {
                        AngularGradient(gradient: Gradient(colors: gradientArray), center: .center, angle: .degrees(colorAngle))
                            .blur(radius: 10)
                            .onAppear {
                                withAnimation(.linear(duration: 7.0)) {
                                    self.colorAngle += 350.0
                                }
                            }
                    }
                    
                    Color.tertiaryBackground
                        .cornerRadius(12)
                        .opacity(0.8)
                    .blur(radius: 3)
                }
            }
        }
        .cornerRadius(12)
        .overlay {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 1)
                    .blendMode(.overlay)
                Image(systemName: iconName)
                    .gradientForeground(colors: [.lavenderGradientColor, .pinkGradientColor])
                    .font(.system(size: 17, weight: .medium))
            }
        }
        .frame(width: 36, height: 36, alignment: .center)
        .padding([.vertical, .leading], 8)
    }
}

struct TextFieldIconView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldIconView(iconName: "key.fill",currentlyEditing: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

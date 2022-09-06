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
    @State private var colorAngle: Double = 0.0
    
    //MARK: - Body
    
    var body: some View {
        Button {
            action()
        } label: {
            GeometryReader { geometry in
                ZStack {
                    AngularGradient(colors: gradientArray, center: .center, angle: .degrees(colorAngle))
                        .blendMode(.overlay)
                        .blur(radius: 8)
                        .mask {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: 50)
                                .frame(maxWidth: geometry.size.width - 16)
                                .blur(radius: 8)
                        }
                        .onAppear {
                            withAnimation(.linear(duration: 7.0)) {
                                self.colorAngle += 350.0
                            }
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
            .previewLayout(.sizeThatFits)
            .padding()
            .background(.black)
    }
}

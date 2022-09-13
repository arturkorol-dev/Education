//
//  GradientProfileImageView.swift
//  Authentication
//
//  Created by Artur Korol on 13.09.2022.
//

import SwiftUI

struct GradientProfileImageView: View {
    //MARK: - Properties
    
    @State private var colorAngle: Double = 0.0
    var profilePicture: UIImage
    
    //MARK: - Body
    
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: gradientArray), center: .center, angle: .degrees(colorAngle))
                .mask {
                    Circle()
                        .frame(width: 70, height: 70, alignment: .center)
                        .blur(radius: 8)
                }
                .blur(radius: 8)
                .onAppear() {
                    withAnimation(.linear(duration: 7)) {
                        self.colorAngle += 360
                    }
                }
            
            Image(uiImage: profilePicture)
                .resizable()
                .scaledToFill()
                .frame(width: 66, height: 66, alignment: .center)
                .mask(
                    Circle()
                )
        }
    }
}

//MARK: - Preview
struct GradientProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        GradientProfileImageView(profilePicture: UIImage(named: "Profile")!)
    }
}

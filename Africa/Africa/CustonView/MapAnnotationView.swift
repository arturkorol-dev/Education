//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Artur Korol on 09.08.2022.
//

import SwiftUI

struct MapAnnotationView: View {
    //MARK: - Properties
    
    let location: NationalParkLocation
    @State private var animation = 0.0
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + animation)
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        }
        .onAppear{
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

//MARK: - Preview

struct MapAnnotationView_Previews: PreviewProvider {
    static let location: [NationalParkLocation] = Bundle.main.decode("locations")
    static var previews: some View {
        MapAnnotationView(location: location[0])
    }
}

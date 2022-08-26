//
//  BlankView.swift
//  Devote
//
//  Created by Artur Korol on 25.08.2022.
//

import SwiftUI

struct BlankView: View {
    //MARK: - Properties
    var backgroundColor: Color
    var backgroundOpacity: Double
    
    //MARK: - Body
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .opacity(backgroundOpacity)
        .blendMode(.overlay)
        .edgesIgnoringSafeArea(.all)
    }
}

//MARK: - Preview
struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: .black, backgroundOpacity: 0.3)
            .background(BackgroundImageView())
            .background(backgroundGradient.ignoresSafeArea())
    }
}

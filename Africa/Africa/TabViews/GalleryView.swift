//
//  GalleryView.swift
//  Africa
//
//  Created by Artur Korol on 03.08.2022.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - Properties
//    let gridLayout = Array(repeating: GridItem(.flexible()), count: 3)
    private let animals: [Animal] = Bundle.main.decode("animals")
    @State private var selectedAnimal = "lion"
    
    //Dynamic grid
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn = 2.0
    private var haptic = UIImpactFeedbackGenerator(style: .medium)
    
    //MARK: - Methods
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(lineWidth: 8)
                    }
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Button {
                            selectedAnimal = item.image
                            haptic.impactOccurred()
                        } label: {
                            Image(item.image)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay {
                                    Circle().stroke(Color.white)
                                }
                        }
                    }
                }
                .onAppear {
                    gridSwitch()
                }
                .animation(.easeIn)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

//MARK: - Preview
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

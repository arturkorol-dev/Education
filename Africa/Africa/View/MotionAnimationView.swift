//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Artur Korol on 11.08.2022.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Properties
    let randomCircle = Int.random(in: 12...16)
    @State var isAnimation = false
    
    //MARK: - Methods
    //1. Random coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        CGFloat.random(in: 0...max)
    }
    //2. Random size
    func randomeSize() -> CGFloat {
        CGFloat(Int.random(in: 10...300))
    }
    
    //3. Random scale
    func randomeScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4. Random speed
    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    
    //4. Random Delay
    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }
    
    //MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                    //2
                        .frame(width: randomeSize(),
                               height: randomeSize(),
                               alignment: .center
                        )
                    //3
                        .scaleEffect(isAnimation ? randomeScale() : 1)
                    //1
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                    //3
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                            //4
                                .speed(randomSpeed())
                            //5
                                .delay(randomDelay())
                            )
                        .onAppear {
                            self.isAnimation = true
                        }
                }
            }
            .drawingGroup()
        }
    }
}

//MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

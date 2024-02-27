//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Ninja on 24/02/2024.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: -PROPERTIES
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    //MARK: -FUNC
    //1. RANDOM CORDINATE
    func randomCordinate(max:CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    //2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    //3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.2...1.0)
    }
    //5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 1...4)
    }
    
    //MARK: -BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize() , height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x : randomCordinate(max: geometry.size.width),
                            y: randomCordinate(max: geometry.size.height)
                    )
                        .onAppear(perform: {
                            withAnimation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .delay(randomDelay())
                                .speed(randomSpeed())
                            ){
                                isAnimating = true
                            }
                                
  
                        })
                }//: LOOP
            }//: ZSTACK
            .drawingGroup()
        }//: GEOMETRY
    }
}

//MARK: -PREVIEW
#Preview {
    MotionAnimationView()
}

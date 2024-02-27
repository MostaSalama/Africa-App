//
//  MapAnnotaionView.swift
//  Africa
//
//  Created by Ninja on 22/02/2024.
//

import SwiftUI

struct MapAnnotaionView: View {
    //MARK: -PROPERTIES
    var location : NationalParkLocation
    @State private var animations :
    Double = 0.0
    //MARK: -BODY
    var body: some View {
        ZStack {
            Circle()
                .fill(.accent)
                .frame(width: 54, height: 54)
            
            Circle()
                .stroke(.accent,lineWidth: 2)
                .frame(width: 52, height: 52)
                .scaleEffect(1 + CGFloat(animations))
                .opacity(1-animations)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
            .clipShape(Circle())
        }//ZSTACK
        .onAppear{
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses : false)) {
                animations = 1
            }
        }
    }
}

#Preview {
    @State var locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    return MapAnnotaionView(location: locations[0])
}

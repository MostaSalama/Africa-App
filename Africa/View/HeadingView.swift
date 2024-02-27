//
//  HeadingView.swift
//  Africa
//
//  Created by Ninja on 20/02/2024.
//

import SwiftUI

struct HeadingView: View {
    //MARK: -PRPERTIES
    var headingImage : String
    var headingText : String
    
    var body: some View {
        HStack {
            Image(systemName :headingImage)
                .foregroundStyle(.accent)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }
        .padding(.vertical)
    }
}

#Preview {
    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in picture")
}

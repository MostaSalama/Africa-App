//
//  CoverImageView.swift
//  Africa
//
//  Created by Ninja on 18/02/2024.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: -PROPERTIES
    let coverImages : [CoverImageModel] = Bundle.main.decode("covers.json")
    
    //MARK: -BODY
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }// END OF LOOP
        } //tabs
        .tabViewStyle(PageTabViewStyle())

     
        
    }
}

//MARK: - PREVIEW
#Preview {
    CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
}

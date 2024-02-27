//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Ninja on 20/02/2024.
//

import SwiftUI

struct InsetGalleryView: View {
    //MARK: -PROPERTIES
    let animal : AnimalModel
    
    //MARK: -BODY
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment:.center , spacing: 15) {
                ForEach(animal.gallery , id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            }   // HTSACK
        }//SCROLL
        
        
    }
}

//MARK: -PREVIEW
#Preview {
    @State var animals : [AnimalModel] = Bundle.main.decode("animals.json")
    return InsetGalleryView(animal: animals[0])
}

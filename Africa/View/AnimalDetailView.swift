//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Ninja on 20/02/2024.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - PROPERTIES
    let animal : AnimalModel
    
    var body: some View {
        
            ScrollView(.vertical , showsIndicators: false){
                VStack(alignment:.center , spacing:20) {
                    //HERO IMAGE
                    Image(animal.image)
                        .resizable()
                        .scaledToFit()
                    
                    //TITLE
                    Text(animal.name.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 8)
                        .foregroundStyle(.primary)
                        .background(
                            Color.accentColor
                                .frame(height: 6)
                                .offset(y:24)
                        )
                        
                    //HEADLINE
                    Text(animal.headline)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .foregroundStyle(.accent)
                        .padding(.horizontal)
                    
                    //GALLERY
                    Group {
                        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictuers")
                        InsetGalleryView(animal: animal)
                            .padding(.bottom)
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    //FACTS
                    Group {
                        HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                        InsetFactView(animal: animal)
                    }
                    .padding(.horizontal)
                    
                    //DESCRIPTION
                    Group {
                        HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                        Text(animal.description)
                            .multilineTextAlignment(.leading)
                            .layoutPriority(1)
                    }
                    .padding(.horizontal)
                    
                    //MAP
                    Group{
                        HeadingView(headingImage: "map", headingText: "National Parks")
                        InsetMapView()
                    }
                    .padding(.horizontal)
                    
                    //LINK
                    Group{
                        HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                        ExternalWeblinkView(animal: animal)
                    }
                    .padding(.horizontal)
                    
                }//VSTACK
                .navigationBarTitle("Learn about \(animal.name)",displayMode:.inline)
                
            }//SCROLL VIEW
        
        
    }
}

//MARK: - PREVIEW
#Preview {
    @State var animals : [AnimalModel] = Bundle.main.decode("animals.json")
    return NavigationView {
        AnimalDetailView(animal: animals[0])
    }
}

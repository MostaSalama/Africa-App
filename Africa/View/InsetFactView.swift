//
//  InsetFactView.swift
//  Africa
//
//  Created by Ninja on 20/02/2024.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: -PROPERTIES
    let animal : AnimalModel
    
    //MARK: -BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact , id: \.self) { item in
                    Text(item)
                    
                }
            }//TABS
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148 ,idealHeight: 165 ,maxHeight: 180)
            
        }//BOX
    }
}

//MARK: -PREVIEW
#Preview {
    @State var animals : [AnimalModel] = Bundle.main.decode("animals.json")
  return InsetFactView(animal: animals[0])
}

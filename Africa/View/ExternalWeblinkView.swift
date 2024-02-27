//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Ninja on 20/02/2024.
//

import SwiftUI

struct ExternalWeblinkView: View {
    //MARK: -PROPERTIES
    let animal : AnimalModel
    
    //MARK: -BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundStyle(.accent)
            }// HSTACK
        }// BOX
    }
}

#Preview {
    @State var animals : [AnimalModel] = Bundle.main.decode("animals.json")
    return ExternalWeblinkView(animal: animals[0])
}

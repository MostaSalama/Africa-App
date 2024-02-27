//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Ninja on 26/02/2024.
//

import SwiftUI

struct AnimalGridItemView: View {
    let animal : AnimalModel
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

#Preview {
    @State var animals : [AnimalModel] = Bundle.main.decode("animals.json")
    return AnimalGridItemView(animal: animals[0])
}

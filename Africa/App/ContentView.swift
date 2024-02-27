//
//  ContentView.swift
//  Africa
//
//  Created by Ninja on 17/02/2024.
//

import SwiftUI

struct ContentView: View {
    //MARK: -PROPERTIES
    let animals :[AnimalModel] = Bundle.main.decode("animals.json")
    @State private var isGridViewActive = false
    @State private var gridLayout : [GridItem] = [GridItem(.flexible()) ]
    @State private var gridColumn = 1
    @State private var toolBarIcon = "square.grid.2x2"
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(.accent)]
    }
    
    //MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        // TOOLBAR IMAGE
        switch gridColumn {
        case 1 :
            toolBarIcon = "square.grid.2x2"
        case 2 :
            toolBarIcon = "square.grid.3x2"
        case 3 :
            toolBarIcon = "rectangle.grid.1x2"
        default :
            toolBarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        
        
        
        NavigationView {
            Group {
                if !isGridViewActive  {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top:0 , leading: 0 ,bottom: 0 ,trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }//: LIST
                } else {
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: LINK
                            }//:LOOP
                        }//:GRID
                        .padding(10)
                        .animation(.easeIn)
                    }//: SCROLL
                } //: CONDITION
            }//: GROUP
            .navigationBarTitle("Africa",displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing:16) {
                        //: LIST
                        Button(action: {
                            isGridViewActive = false
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .white : .accent )
                            
                        })
                        
                        //: GRID
                        Button(action: {
                            isGridViewActive = true
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? .accent : .white )
                            
                        })
                    }//:HSTACK
                }//: BUTTONS
            }//TOOLBAR
            
            
            
            
            
            
        }//NAVIGATION
        
    }
}

#Preview {
    ContentView()
}

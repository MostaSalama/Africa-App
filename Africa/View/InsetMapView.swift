//
//  InsetMapView.swift
//  Africa
//
//  Created by Ninja on 20/02/2024.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    //MARK: -PROPERTIES
    
    @State private var region = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)))
    
    //MARK: -BODY
    var body: some View {
        Map(position: $region)
            .overlay(alignment:.topTrailing) {
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundStyle(.accent)
                            .fontWeight(.bold)
                    }//HSTACK
                    .padding(.vertical,10)
                    .padding(.horizontal,14)
                    .background(
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    )
                } //NAVIGATION
                .padding(12)
                
            }
            .frame(height: 260)
            .cornerRadius(12)
        
    }
}

//MARK: -PREVIEW
#Preview {
    InsetMapView()
}

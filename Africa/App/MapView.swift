//
//  MapView.swift
//  Africa
//
//  Created by Ninja on 17/02/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: -PROPERTIES
    @State private var region : MKCoordinateRegion = {
        var mapCordinates = CLLocationCoordinate2DMake(6.600286, 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations : [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: -BODY
    var body: some View {
       
//        Map(position: $region) {
//            ForEach(locations) { item in
//                Annotation(item.name, coordinate: item.location) {
//                    MapAnnotaionView(location: item)
//                }
//                
//            }
//            
//        }
//        .overlay (
//            HStack(alignment:.center,spacing: 12) {
//                Image("compass")
//                    .resizable()
//                    .scaledToFit()
//                .frame(width: 48, height: 48)
//                
//                VStack(alignment: .leading,spacing: 3) {
//                    HStack {
//                        Text("Latitude:")
//                            .font(.footnote)
//                            .fontWeight(.bold)
//                            .foregroundStyle(.accent)
//                        
//                        Spacer()
//                        
//                        Text("\(region.region?.center.latitude ?? 0)")
//                            .font(.footnote)
//                            .foregroundStyle(.white)
//                    }
//                    
//                    Divider()
//                    
//                    HStack {
//                        Text("Longitude:")
//                            .font(.footnote)
//                            .fontWeight(.bold)
//                            .foregroundStyle(.accent)
//                        
//                        Spacer()
//                        
//                        
//                        Text("\(region.region?.center.longitude ?? 0)")
//                            .font(.footnote)
//                            .foregroundStyle(.white)
//                    }
//                }
//            }//HSTACK
//                .padding(.vertical,12)
//                .padding(.horizontal,16)
//                .background(
//                    Color.black
//                        .cornerRadius(8)
//                        .opacity(0.6)
//                )
//                .padding()
//            , alignment: .top
//                
//        )
//        .mapStyle(.imagery(elevation: .realistic))
        
        Map(coordinateRegion: $region ,annotationItems: locations) { item in
            MapAnnotation(coordinate: item.location) {
                MapAnnotaionView(location: item)
            }//ANOTATION
        }//MAP
        .overlay(
            HStack(alignment:.center,spacing: 12) {
                           Image("compass")
                               .resizable()
                               .scaledToFit()
                           .frame(width: 48, height: 48)
           
                           VStack(alignment: .leading,spacing: 3) {
                               HStack {
                                   Text("Latitude:")
                                       .font(.footnote)
                                       .fontWeight(.bold)
                                       .foregroundStyle(.accent)
           
                                   Spacer()
           
                                   Text("\(region.center.latitude )")
                                       .font(.footnote)
                                       .foregroundStyle(.white)
                               }
           
                               Divider()
           
                               HStack {
                                   Text("Longitude:")
                                       .font(.footnote)
                                       .fontWeight(.bold)
                                       .foregroundStyle(.accent)
           
                                   Spacer()
           
           
                                   Text("\(region.center.longitude)")
                                       .font(.footnote)
                                       .foregroundStyle(.white)
                               }
                           }
                       }//HSTACK
                           .padding(.vertical,12)
                           .padding(.horizontal,16)
                           .background (
                               Color.black
                                   .cornerRadius(8)
                                   .opacity(0.6)
                           )
                           .padding()
                       , alignment: .top
        )
        
      
       
    }
}

//MARK: -PREVIEW
#Preview {
    MapView()
}

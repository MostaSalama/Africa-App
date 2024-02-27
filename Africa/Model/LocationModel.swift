//
//  LocationModel.swift
//  Africa
//
//  Created by Ninja on 21/02/2024.
//

import Foundation
import MapKit

struct NationalParkLocation : Identifiable ,Codable {
    var id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    //COMPUTED
    var location :CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

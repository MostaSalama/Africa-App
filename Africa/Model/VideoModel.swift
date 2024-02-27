//
//  VideoModel.swift
//  Africa
//
//  Created by Ninja on 20/02/2024.
//

import SwiftUI

struct VideoModel: Identifiable,Codable {
    let id : String
    let name : String
    let headline : String
    
    //Computed Property
    var thumbnail : String {
        "video-\(id)"
    }
}

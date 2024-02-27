//
//  AnimalModel.swift
//  Africa
//
//  Created by Ninja on 18/02/2024.
//

import Foundation

struct AnimalModel:Codable , Identifiable {
    let id : String
    let name : String
    let headline : String
    let description : String
    let link : String
    let image : String
    let gallery : [String]
    let fact : [String]
}

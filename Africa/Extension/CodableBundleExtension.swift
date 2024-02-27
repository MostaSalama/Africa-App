//
//  CodableBundleExtenstion.swift
//  Africa
//
//  Created by Ninja on 18/02/2024.
//

import SwiftUI

extension Bundle {
    func decode<T: Codable>(_ file:String) -> T {
        //1. LOCATE JSON FILE
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        //2. CREATE A PROPERTY FOR THE DATA
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        //3. CREATE A DECODER
        let decoder = JSONDecoder()
        
        //4. CREATE A PROPERTY FOR THE DECODED DATA
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle ")
            
        }
        //5. RETURN THE READY-TO-USE DATA
        return loaded
    }
}



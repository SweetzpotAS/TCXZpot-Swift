//
//  Position.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct Position {
    fileprivate let latitude : Double
    fileprivate let longitude : Double
    
    public init?(latitude : Double, longitude : Double) {
        guard latitude >= -90 && latitude <= 90 && longitude >= -180 && longitude <= 180 else {
            return nil
        }
        self.latitude = latitude
        self.longitude = longitude
    }
}

extension Position : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Position>")
        serializer.print(line: "<LatitudeDegrees>\(latitude)</LatitudeDegrees>")
        serializer.print(line: "<LongitudeDegrees>\(longitude)</LongitudeDegrees>")
        serializer.print(line: "</Position>")
    }
}

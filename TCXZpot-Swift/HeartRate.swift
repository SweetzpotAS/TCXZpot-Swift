//
//  HeartRate.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct HeartRate {
    fileprivate let bpm : Int
    
    public init(bpm : Int) {
        self.bpm = bpm
    }
}

extension HeartRate : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Value>\(bpm)</Value>")
    }
}

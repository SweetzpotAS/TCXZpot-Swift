//
//  Cadence.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct Cadence {
    fileprivate let value : Int
    
    public init(value : Int) {
        self.value = value
    }
}

extension Cadence : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Cadence>\(value)</Cadence>")
    }
}

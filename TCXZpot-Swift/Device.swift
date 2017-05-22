//
//  Device.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct Device {
    fileprivate let name : String
    fileprivate let unitID : Int
    fileprivate let productID : Int
    fileprivate let version : Version
    
    public init(name : String, unitID : Int, productID : Int, version : Version) {
        self.name = name
        self.unitID = unitID
        self.productID = productID
        self.version = version
    }
}

extension Device : AbstractSource {
    public var tcxType : String {
        return "Device_t"
    }
}

extension Device : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Name>\(name)</Name>")
        serializer.print(line: "<UnitId>\(unitID)</UnitId>")
        serializer.print(line: "<ProductID>\(productID)</ProductID>")
        version.serialize(to: serializer)
    }
}

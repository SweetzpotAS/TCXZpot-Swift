//
//  Device.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright 2017 SweetZpot AS

//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at

//  http://www.apache.org/licenses/LICENSE-2.0

//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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

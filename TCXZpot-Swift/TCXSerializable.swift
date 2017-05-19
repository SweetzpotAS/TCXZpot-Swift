//
//  TCXSerializable.swift
//  TCXZpot-Swift
//
//  Created by Tomás Ruiz López on 19/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public protocol TCXSerializable {
    func serialize(to serializer : Serializer)
}

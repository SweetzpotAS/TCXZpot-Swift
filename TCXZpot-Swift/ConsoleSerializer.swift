//
//  ConsoleSerializer.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 24/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct ConsoleSerializer : Serializer {
    public func print(line: String) {
        show(line)
    }
}

fileprivate func show(_ line : String) {
    print(line)
}

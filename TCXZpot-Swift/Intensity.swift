//
//  Intensity.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public enum Intensity {
    case active
    case resting
}

extension Intensity : CustomStringConvertible {
    public var description : String {
        switch self {
        case .active: return "Active"
        case .resting: return "Resting"
        }
    }
}

extension Intensity : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Intensity>\(description)</Intensity>")
    }
}

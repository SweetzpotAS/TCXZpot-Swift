//
//  Sport.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public enum Sport {
    case running
    case biking
    case other
}

extension Sport : CustomStringConvertible {
    public var description : String {
        switch self {
        case .running: return "Running"
        case .biking: return "Biking"
        case .other: return "Other"
        }
    }
}

extension Sport : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: description)
    }
}

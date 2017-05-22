//
//  SensorState.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public enum SensorState {
    case present
    case absent
}

extension SensorState : CustomStringConvertible {
    public var description : String {
        switch self {
        case .present: return "Present"
        case .absent: return "Absent"
        }
    }
}

extension SensorState : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<SensorState>\(description)</SensorState>")
    }
}

//
//  TriggerMethod.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public enum TriggerMethod {
    case manual
    case distance
    case location
    case time
    case heartRate
}

extension TriggerMethod : CustomStringConvertible {
    public var description : String {
        switch self {
        case .manual: return "Manual"
        case .distance: return "Distance"
        case .location: return "Location"
        case .time: return "Time"
        case .heartRate: return "HeartRate"
        }
    }
}

extension TriggerMethod : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<TriggerMethod>\(description)</TriggerMethod>")
    }
}

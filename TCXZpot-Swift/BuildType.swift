//
//  BuildType.swift
//  TCXZpot-Swift
//
//  Created by Tomás Ruiz López on 19/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

enum BuildType {
    case Internal
    case Alpha
    case Beta
    case Release
}

extension BuildType : CustomStringConvertible {
    var description : String {
        switch self {
        case .Internal: return "Internal"
        case .Alpha: return "Alpha"
        case .Beta: return "Beta"
        case .Release: return "Release"
        }
    }
}

extension BuildType : TCXSerializable {
    func serialize(to serializer: Serializer) {
        serializer.print(line: "<Type>\(self.description)</Type>")
    }
}

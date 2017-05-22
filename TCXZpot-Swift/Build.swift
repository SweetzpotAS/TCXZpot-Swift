//
//  Build.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 19/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct Build {
    fileprivate let version : Version
    fileprivate let type : BuildType?
    fileprivate let time : String?
    
    public init(version : Version, type : BuildType? = nil, time : String? = nil) {
        self.version = version
        self.type = type
        self.time = time
    }
}

extension Build : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Build>")
        version.serialize(to: serializer)
        type.flatMap{ type in type.serialize(to: serializer) }
        time.flatMap{ time in serializer.print(line: "<Time>\(time)</Time>") }
        serializer.print(line: "</Build>")
    }
}

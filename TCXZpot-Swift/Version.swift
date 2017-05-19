//
//  Version.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 19/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct Version {
    fileprivate let versionMajor : Int
    fileprivate let versionMinor : Int
    fileprivate let buildMajor : Int
    fileprivate let buildMinor : Int
    
    public init(versionMajor : Int, versionMinor : Int, buildMajor : Int = 0, buildMinor : Int = 0) {
        self.versionMajor = versionMajor
        self.versionMinor = versionMinor
        self.buildMajor = buildMajor
        self.buildMinor = buildMinor
    }
}

extension Version : TCXSerializable {
    public func serialize(to serializer : Serializer) {
        serializer.print(line: "<Version>")
        serializer.print(line: "<VersionMajor>\(self.versionMajor)</VersionMajor>")
        serializer.print(line: "<VersionMinor>\(self.versionMinor)</VersionMinor>")
        serializer.print(line: "<BuildMajor>\(self.buildMajor)</BuildMajor>")
        serializer.print(line: "<BuildMinor>\(self.buildMinor)</BuildMinor>")
        serializer.print(line: "</Version>")
    }
}

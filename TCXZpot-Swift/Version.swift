//
//  Version.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 19/5/17.
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

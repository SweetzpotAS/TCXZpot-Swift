//
//  Build.swift
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

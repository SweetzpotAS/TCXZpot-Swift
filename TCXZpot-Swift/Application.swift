//
//  Application.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
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

public struct Application {
    fileprivate let name : String
    fileprivate let build : Build
    fileprivate let languageID : String
    fileprivate let partNumber : String
    
    public init(name : String, build : Build, languageID : String, partNumber : String) {
        self.name = name
        self.build = build
        self.languageID = languageID
        self.partNumber = partNumber
    }
}

extension Application : AbstractSource {
    public var tcxType : String {
        return "Application_t"
    }
}

extension Application : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Name>\(name)</Name>")
        build.serialize(to: serializer)
        serializer.print(line: "<LangID>\(languageID)</LangID>")
        serializer.print(line: "<PartNumber>\(partNumber)</PartNumber>")
    }
}

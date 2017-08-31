//
//  FileSerializer.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 24/5/17.
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

public class FileSerializer : Serializer {
    private var lines : [String] = []
    
    public init() {}
    
    public func print(line: String) {
        lines.append(line)
    }
    
    public func save(toPath path : String) throws {
        do {
            try lines.joined(separator: "\n").write(toFile: path, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            throw SerializationError.fileNotSaved
        }
    }
}

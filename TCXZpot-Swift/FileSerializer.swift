//
//  FileSerializer.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 24/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public class FileSerializer : Serializer {
    private var lines : [String] = []
    
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

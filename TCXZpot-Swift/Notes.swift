//
//  Notes.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct Notes {
    fileprivate let text : String
    
    public init(text : String) {
        self.text = text
    }
}

extension Notes : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Notes>\(text)</Notes>")
    }
}

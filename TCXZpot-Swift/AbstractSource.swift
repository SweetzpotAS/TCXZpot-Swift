//
//  AbstractSource.swift
//  TCXZpot-Swift
//
//  Created by Tomás Ruiz López on 19/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public class AbstractSource : TCXSerializable {
    private let name : String
    
    init(name : String) {
        self.name = name
    }
    
    func tcxType() -> String {
        fatalError("tcxType must be override")
    }
    
    public func serialize(to serializer: Serializer) {
        fatalError("serialize must be override")
    }
}

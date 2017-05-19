//
//  MockSerializer.swift
//  TCXZpot-Swift
//
//  Created by Tomás Ruiz López on 19/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation
@testable import TCXZpot

class MockSerializer : Serializer {
    private var printed : [String] = []
    
    func print(line : String) {
        self.printed.append(line)
    }
    
    func hasPrinted(_ line : String) -> Bool {
        return self.printed.contains(line)
    }
}

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
    var printed : String = ""
    
    func print(line : String) {
        self.printed = line
    }
}

//
//  CadenceTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class CadenceTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let cadence = Cadence(value : 15)
        let serializer = MockSerializer()
        
        cadence.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Cadence>15</Cadence>"))
    }
    
}

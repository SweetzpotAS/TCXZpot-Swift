//
//  TriggerMethodTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class TriggerMethodTest: XCTestCase {

    func testSerializesCorrectly() {
        let triggerMethod = TriggerMethod.distance
        let serializer = MockSerializer()
        
        triggerMethod.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<TriggerMethod>Distance</TriggerMethod>"))
    }
    
}

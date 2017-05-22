//
//  SensorStateTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class SensorStateTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let sensorState = SensorState.absent
        let serializer = MockSerializer()
        
        sensorState.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<SensorState>Absent</SensorState>"))
    }
    
}

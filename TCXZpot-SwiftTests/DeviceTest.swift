//
//  DeviceTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class DeviceTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let device = Device(name: "BreathZpot",
                            unitID: 0,
                            productID: 1,
                            version: Version(versionMajor: 1, versionMinor: 0))
        let serializer = MockSerializer()
        
        device.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Name>BreathZpot</Name>"))
        XCTAssertTrue(serializer.hasPrinted("<UnitId>0</UnitId>"))
        XCTAssertTrue(serializer.hasPrinted("<ProductID>1</ProductID>"))
        XCTAssertTrue(serializer.hasPrinted("<Version>"))
    }
    
}

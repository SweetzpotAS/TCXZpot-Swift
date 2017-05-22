//
//  HeartRateTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class HeartRateTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let heartRate = HeartRate(bpm : 58)
        let serializer = MockSerializer()
        
        heartRate.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Value>58</Value>"))
    }
    
}

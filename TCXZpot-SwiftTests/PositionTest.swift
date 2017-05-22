//
//  PositionTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class PositionTest: XCTestCase {
    
    func testDoesNotCreateValueIfLatitudeIsOffLimits() {
        let position = Position(latitude: -150, longitude: 0)
        
        XCTAssertNil(position)
    }
    
    func testDoesNotCreateValueIfLongitudeIsOffLimits() {
        let position = Position(latitude: 0, longitude: 300)
        
        XCTAssertNil(position)
    }
    
    func testSerializesCorrectly() {
        let position = Position(latitude: 40.5, longitude: -21.7)!
        let serializer = MockSerializer()
        
        position.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Position>"))
        XCTAssertTrue(serializer.hasPrinted("<LatitudeDegrees>40.5</LatitudeDegrees>"))
        XCTAssertTrue(serializer.hasPrinted("<LongitudeDegrees>-21.7</LongitudeDegrees>"))
        XCTAssertTrue(serializer.hasPrinted("</Position>"))
    }
    
}

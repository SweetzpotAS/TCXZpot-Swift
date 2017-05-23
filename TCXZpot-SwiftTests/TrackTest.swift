//
//  TrackTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 23/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class TrackTest: XCTestCase {
    
    func testSerializesProperly() {
        let track = Track(with: Trackpoint(time: TCXDate(day: 1, month: 1, year: 2017, hour: 0, minute: 0, second: 0)!))
        let serializer = MockSerializer()
        
        track.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Track>"))
        XCTAssertTrue(serializer.hasPrinted("<Trackpoint>"))
        XCTAssertTrue(serializer.hasPrinted("</Track>"))
    }
    
}

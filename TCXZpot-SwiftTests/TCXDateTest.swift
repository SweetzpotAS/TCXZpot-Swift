//
//  TCXDateTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 23/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class TCXDateTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let date = TCXDate(day: 1, month: 2, year: 2017, hour: 13, minute: 59, second: 23)
        let serializer = MockSerializer()
        
        date?.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("2017-02-01T13:59:23.000Z"))
    }
    
}

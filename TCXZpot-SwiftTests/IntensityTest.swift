//
//  IntensityTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class IntensityTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let intensity = Intensity.active
        let serializer = MockSerializer()
        
        intensity.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Intensity>Active</Intensity>"))
    }
    
}

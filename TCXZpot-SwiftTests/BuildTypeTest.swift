//
//  BuildTypeTest.swift
//  TCXZpot-Swift
//
//  Created by Tomás Ruiz López on 19/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class BuildTypeTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let serializer = MockSerializer()
        
        BuildType.Release.serialize(to: serializer)
        
        XCTAssertEqual("<Type>Release</Type>", serializer.printed)
    }
    
}

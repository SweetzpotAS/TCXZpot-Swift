//
//  BuildTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class BuildTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let version = Version(versionMajor: 1, versionMinor: 0)
        let build = Build(version: version,
                          type: .Alpha,
                          time: "2017-02-09T13:14:45.123Z")
        let serializer = MockSerializer()
        
        build.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Build>"))
        XCTAssertTrue(serializer.hasPrinted("<Version>"))
        XCTAssertTrue(serializer.hasPrinted("<Type>Alpha</Type>"))
        XCTAssertTrue(serializer.hasPrinted("<Time>2017-02-09T13:14:45.123Z</Time>"))
        XCTAssertTrue(serializer.hasPrinted("</Build>"))
    }
    
    func testSerializesShortVersionCorrectly() {
        let version = Version(versionMajor: 1, versionMinor: 0)
        let build = Build(version: version)
        let serializer = MockSerializer()
        
        build.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Build>"))
        XCTAssertTrue(serializer.hasPrinted("<Version>"))
        XCTAssertTrue(serializer.hasPrinted("</Build>"))
    }
}

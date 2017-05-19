//
//  VersionTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 19/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class VersionTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let serializer = MockSerializer()
        
        Version(versionMajor: 3, versionMinor: 1, buildMajor: 10, buildMinor: 2)
            .serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Version>"))
        XCTAssertTrue(serializer.hasPrinted("<VersionMajor>3</VersionMajor>"))
        XCTAssertTrue(serializer.hasPrinted("<VersionMinor>1</VersionMinor>"))
        XCTAssertTrue(serializer.hasPrinted("<BuildMajor>10</BuildMajor>"))
        XCTAssertTrue(serializer.hasPrinted("<BuildMinor>2</BuildMinor>"))
        XCTAssertTrue(serializer.hasPrinted("</Version>"))
    }
    
    func testSerializesShortVersionCorrectly() {
        let serializer = MockSerializer()
        
        Version(versionMajor: 3, versionMinor: 1)
            .serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Version>"))
        XCTAssertTrue(serializer.hasPrinted("<VersionMajor>3</VersionMajor>"))
        XCTAssertTrue(serializer.hasPrinted("<VersionMinor>1</VersionMinor>"))
        XCTAssertTrue(serializer.hasPrinted("<BuildMajor>0</BuildMajor>"))
        XCTAssertTrue(serializer.hasPrinted("<BuildMinor>0</BuildMinor>"))
        XCTAssertTrue(serializer.hasPrinted("</Version>"))
    }
}

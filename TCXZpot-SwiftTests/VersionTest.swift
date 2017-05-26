//
//  VersionTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 19/5/17.
//  Copyright 2017 SweetZpot AS

//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at

//  http://www.apache.org/licenses/LICENSE-2.0

//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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

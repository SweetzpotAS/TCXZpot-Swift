//
//  BuildTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
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

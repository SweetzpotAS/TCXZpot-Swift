//
//  ApplicationTest.swift
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

class ApplicationTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let build = Build(version: Version(versionMajor: 1, versionMinor: 0))
        let application = Application(name: "SweetZpot Rowing",
                                      build: build,
                                      languageID: "en",
                                      partNumber: "123-45678-90")
        let serializer = MockSerializer()
        
        application.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Name>SweetZpot Rowing</Name>"))
        XCTAssertTrue(serializer.hasPrinted("<Build>"))
        XCTAssertTrue(serializer.hasPrinted("<LangID>en</LangID>"))
        XCTAssertTrue(serializer.hasPrinted("<PartNumber>123-45678-90</PartNumber>"))
    }
    
}

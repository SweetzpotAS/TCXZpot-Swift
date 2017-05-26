//
//  TrainingCenterDatabaseTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 24/5/17.
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

class TrainingCenterDatabaseTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let trainingCenterDatabase = TrainingCenterDatabase(activities: Activities(with: []),
                                                            author: Device(name: "BreathZpot", unitID: 123, productID: 456, version: Version(versionMajor: 1, versionMinor: 0)))
        let serializer = MockSerializer()
        
        trainingCenterDatabase.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<?xml version=\"1.0\" encoding=\"UTF-8\"?>"))
        XCTAssertTrue(serializer.hasPrinted("<TrainingCenterDatabase\n" +
            "  xsi:schemaLocation=\"http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd\"\n" +
            "  xmlns=\"http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2\"\n" +
            "  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">"))
        XCTAssertTrue(serializer.hasPrinted("<Activities>"))
        XCTAssertTrue(serializer.hasPrinted("<Author xsi:type=\"Device_t\">"))
        XCTAssertTrue(serializer.hasPrinted("</TrainingCenterDatabase>"))
    }
    
}

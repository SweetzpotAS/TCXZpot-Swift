//
//  PositionTest.swift
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

class PositionTest: XCTestCase {
    
    func testDoesNotCreateValueIfLatitudeIsOffLimits() {
        let position = Position(latitude: -150, longitude: 0)
        
        XCTAssertNil(position)
    }
    
    func testDoesNotCreateValueIfLongitudeIsOffLimits() {
        let position = Position(latitude: 0, longitude: 300)
        
        XCTAssertNil(position)
    }
    
    func testSerializesCorrectly() {
        let position = Position(latitude: 40.5, longitude: -21.7)!
        let serializer = MockSerializer()
        
        position.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Position>"))
        XCTAssertTrue(serializer.hasPrinted("<LatitudeDegrees>40.5</LatitudeDegrees>"))
        XCTAssertTrue(serializer.hasPrinted("<LongitudeDegrees>-21.7</LongitudeDegrees>"))
        XCTAssertTrue(serializer.hasPrinted("</Position>"))
    }
    
}

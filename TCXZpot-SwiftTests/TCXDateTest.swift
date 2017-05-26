//
//  TCXDateTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 23/5/17.
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

class TCXDateTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let date = TCXDate(day: 1, month: 2, year: 2017, hour: 13, minute: 59, second: 23)
        let serializer = MockSerializer()
        
        date?.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("2017-02-01T13:59:23.000Z"))
    }
    
}

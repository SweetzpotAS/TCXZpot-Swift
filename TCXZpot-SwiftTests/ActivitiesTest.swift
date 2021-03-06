//
//  ActivitiesTest.swift
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

class ActivitiesTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let activities = Activities(with: Activity(id: TCXDate(day: 1,
                                                               month: 1,
                                                               year: 2017,
                                                               hour: 0,
                                                               minute: 0,
                                                               second: 0)!,
                                                   laps: [],
                                                   sport: Sport.biking))
        let serializer = MockSerializer()
        
        activities.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Activities>"))
        XCTAssertTrue(serializer.hasPrinted("<Activity Sport=\"Biking\">"))
        XCTAssertTrue(serializer.hasPrinted("</Activities>"))
    }
    
}

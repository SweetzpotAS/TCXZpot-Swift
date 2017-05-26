//
//  TrackpointTest.swift
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

class TrackpointTest: XCTestCase {

    func testSerializesCorrectly() {
        let trackpoint = Trackpoint(time: TCXDate(day: 1, month: 1, year: 2017, hour: 0, minute: 0, second: 0)!,
                                    position: Position(latitude: 40.5, longitude: -21.7),
                                    altitude: 123,
                                    distance: 4567,
                                    heartRate: HeartRate(bpm: 67),
                                    cadence: Cadence(value: 28),
                                    sensorState: .absent)
        let serializer = MockSerializer()
        
        trackpoint.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Trackpoint>"))
        XCTAssertTrue(serializer.hasPrinted("<Time>"))
        XCTAssertTrue(serializer.hasPrinted("2017-01-01T00:00:00.000Z"))
        XCTAssertTrue(serializer.hasPrinted("</Time>"))
        XCTAssertTrue(serializer.hasPrinted("<Position>"))
        XCTAssertTrue(serializer.hasPrinted("<AltitudeMeters>123.0</AltitudeMeters>"))
        XCTAssertTrue(serializer.hasPrinted("<DistanceMeters>4567.0</DistanceMeters>"))
        XCTAssertTrue(serializer.hasPrinted("<HeartRateBpm>"))
        XCTAssertTrue(serializer.hasPrinted("<Value>67</Value>"))
        XCTAssertTrue(serializer.hasPrinted("</HeartRateBpm>"))
        XCTAssertTrue(serializer.hasPrinted("<Cadence>28</Cadence>"))
        XCTAssertTrue(serializer.hasPrinted("<SensorState>Absent</SensorState>"))
        XCTAssertTrue(serializer.hasPrinted("</Trackpoint>"))
    }
    
}

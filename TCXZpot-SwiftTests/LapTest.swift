//
//  LapTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 24/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class LapTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let lap = Lap(startTime: TCXDate(day: 1, month: 1, year: 2017, hour: 0, minute: 0, second: 0)!,
            totalTime: 125,
            distance: 67,
            maximumSpeed: 23,
            calories: 200,
            averageHeartRate: HeartRate(bpm: 92),
            maximumHeartRate: HeartRate(bpm: 120),
            intensity: Intensity.active,
            cadence: Cadence(value: 10),
            triggerMethod: TriggerMethod.manual,
            tracks: Track(with: []),
            notes: Notes(text: "Some notes"))
        let serializer = MockSerializer()
        
        lap.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Lap StartTime=\"2017-01-01T00:00:00.000Z\">"))
        XCTAssertTrue(serializer.hasPrinted("<TotalTimeSeconds>125.0</TotalTimeSeconds>"))
        XCTAssertTrue(serializer.hasPrinted("<DistanceMeters>67.0</DistanceMeters>"))
        XCTAssertTrue(serializer.hasPrinted("<MaximumSpeed>23.0</MaximumSpeed>"))
        XCTAssertTrue(serializer.hasPrinted("<Calories>200</Calories>"))
        XCTAssertTrue(serializer.hasPrinted("<AverageHeartRateBpm>"))
        XCTAssertTrue(serializer.hasPrinted("<MaximumHeartRateBpm>"))
        XCTAssertTrue(serializer.hasPrinted("<Intensity>Active</Intensity>"))
        XCTAssertTrue(serializer.hasPrinted("<Cadence>10</Cadence>"))
        XCTAssertTrue(serializer.hasPrinted("<TriggerMethod>Manual</TriggerMethod>"))
        XCTAssertTrue(serializer.hasPrinted("<Track>"))
        XCTAssertTrue(serializer.hasPrinted("<Notes>Some notes</Notes>"))
        XCTAssertTrue(serializer.hasPrinted("</Lap>"))
    }
    
    func testSerializesShortVersionCorrectly() {
        let lap = Lap(startTime: TCXDate(day: 1, month: 1, year: 2017, hour: 0, minute: 0, second: 0)!,
                      totalTime: 125,
                      distance: 67,
                      calories: 200,
                      intensity: Intensity.active,
                      triggerMethod: TriggerMethod.manual,
                      tracks: nil)
        let serializer = MockSerializer()
        
        lap.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Lap StartTime=\"2017-01-01T00:00:00.000Z\">"))
        XCTAssertTrue(serializer.hasPrinted("<TotalTimeSeconds>125.0</TotalTimeSeconds>"))
        XCTAssertTrue(serializer.hasPrinted("<DistanceMeters>67.0</DistanceMeters>"))
        XCTAssertTrue(serializer.hasPrinted("<Calories>200</Calories>"))
        XCTAssertTrue(serializer.hasPrinted("<Intensity>Active</Intensity>"))
        XCTAssertTrue(serializer.hasPrinted("<TriggerMethod>Manual</TriggerMethod>"))
        XCTAssertTrue(serializer.hasPrinted("</Lap>"))
    }
}

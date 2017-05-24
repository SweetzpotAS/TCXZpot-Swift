//
//  ActivityTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 24/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class ActivityTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let activity = Activity(id: TCXDate(day: 1, month: 1, year: 2017, hour: 0, minute: 0, second: 0)!,
                                laps: [Lap(startTime: TCXDate(day: 1, month: 1, year: 2017, hour: 0, minute: 0, second: 0)!,
                                           totalTime: 60,
                                           distance: 10,
                                           calories: 15,
                                           intensity: Intensity.active,
                                           triggerMethod: TriggerMethod.manual,
                                           tracks: nil),
                                    ],
                                notes: Notes(text: "Some notes"),
                                creator: Application(name: "SweetZpot Rowing",
                                                     build: Build(version: Version(versionMajor: 1, versionMinor: 0)),
                                                     languageID: "en",
                                                     partNumber: "123-45678-90"),
                                sport: Sport.running)
        let serializer = MockSerializer()
        
        activity.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Activity Sport=\"Running\">"))
        XCTAssertTrue(serializer.hasPrinted("<Lap StartTime=\"2017-01-01T00:00:00.000Z\">"))
        XCTAssertTrue(serializer.hasPrinted("<Notes>Some notes</Notes>"))
        XCTAssertTrue(serializer.hasPrinted("<Creator xsi:type=\"Application_t\">"))
        XCTAssertTrue(serializer.hasPrinted("</Activity>"))
    }
    
}

//
//  ActivitiesTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 24/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

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

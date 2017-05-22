//
//  NotesTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import XCTest
@testable import TCXZpot

class NotesTest: XCTestCase {
    
    func testSerializesCorrectly() {
        let notes = Notes(text: "Some notes")
        let serializer = MockSerializer()
        
        notes.serialize(to: serializer)
        
        XCTAssertTrue(serializer.hasPrinted("<Notes>Some notes</Notes>"))
    }
    
}

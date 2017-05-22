//
//  ApplicationTest.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 22/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

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

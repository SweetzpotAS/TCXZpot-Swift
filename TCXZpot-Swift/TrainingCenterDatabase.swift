//
//  TrainingCenterDatabase.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 24/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct TrainingCenterDatabase {
    fileprivate let activities : Activities?
    fileprivate let author : (AbstractSource & TCXSerializable)?
    
    public init(activities : Activities? = nil, author : (AbstractSource & TCXSerializable)? = nil) {
        self.activities = activities
        self.author = author
    }
}

extension TrainingCenterDatabase : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<?xml version=\"1.0\" encoding=\"UTF-8\"?>")
        serializer.print(line: "<TrainingCenterDatabase\n" +
            "  xsi:schemaLocation=\"http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2 http://www.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd\"\n" +
            "  xmlns=\"http://www.garmin.com/xmlschemas/TrainingCenterDatabase/v2\"\n" +
            "  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">")
        activities?.serialize(to: serializer)
        author.flatMap{
            serializer.print(line: "<Author xsi:type=\"\($0.tcxType)\">")
            $0.serialize(to: serializer)
            serializer.print(line: "</Author>")
        }
        serializer.print(line: "</TrainingCenterDatabase>")
    }
}

//
//  Activity.swift
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

import Foundation

public struct Activity {
    fileprivate let id : TCXDate
    fileprivate let laps : [Lap]
    fileprivate let notes : Notes?
    fileprivate let creator : (AbstractSource & TCXSerializable)?
    fileprivate let sport : Sport
    
    public init(id : TCXDate, laps : [Lap], notes : Notes? = nil, creator : (AbstractSource & TCXSerializable)? = nil, sport : Sport) {
        self.id = id
        self.laps = laps
        self.notes = notes
        self.creator = creator
        self.sport = sport
    }
}

extension Activity : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Activity Sport=\"\(sport.description)\">")
        serializer.print(line: "<Id>\(id.description)</Id>")
        laps.forEach{ $0.serialize(to: serializer) }
        notes?.serialize(to: serializer)
        creator.flatMap{
            serializer.print(line: "<Creator xsi:type=\"\($0.tcxType)\">")
            $0.serialize(to: serializer)
            serializer.print(line: "</Creator>")
        }
        serializer.print(line: "</Activity>")
    }
}

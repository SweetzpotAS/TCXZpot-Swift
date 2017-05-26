//
//  TCXDate.swift
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

import Foundation

public struct TCXDate {
    fileprivate let date : Date
    
    public init?(day : Int, month : Int, year : Int, hour : Int, minute : Int, second : Int) {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        components.hour = hour
        components.minute = minute
        components.second = second
    
        if let date = Calendar.current.date(from: components) {
            self.date = date
        } else {
            return nil
        }
    }
}

extension TCXDate : CustomStringConvertible {
    public var description : String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return formatter.string(from: self.date)
    }
}

extension TCXDate : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: description)
    }
}

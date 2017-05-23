//
//  TCXDate.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 23/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

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

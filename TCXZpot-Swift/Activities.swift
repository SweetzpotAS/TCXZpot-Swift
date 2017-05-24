//
//  Activities.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 24/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct Activities {
    fileprivate let activities : [Activity]
    
    public init(with activities : Activity...) {
        self.activities = activities
    }
    
    public init(with activities : [Activity]) {
        self.activities = activities
    }
}

extension Activities : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Activities>")
        activities.forEach{ $0.serialize(to: serializer) }
        serializer.print(line: "</Activities>")
    }
}

//
//  Track.swift
//  TCXZpot
//
//  Created by Tomás Ruiz López on 23/5/17.
//  Copyright © 2017 SweetZpot. All rights reserved.
//

import Foundation

public struct Track {
    fileprivate let trackpoints : [Trackpoint]
    
    public init(with trackpoints : Trackpoint...) {
        self.trackpoints = trackpoints
    }
    
    public init(with trackpoints : [Trackpoint]) {
        self.trackpoints = trackpoints
    }
}

extension Track : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Track>")
        trackpoints.forEach{ $0.serialize(to: serializer) }
        serializer.print(line: "</Track>")
    }
}

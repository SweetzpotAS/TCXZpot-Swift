//
//  Trackpoint.swift
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

public struct Trackpoint {
    fileprivate let time : TCXDate
    fileprivate let position : Position?
    fileprivate let altitude : Double?
    fileprivate let distance : Double?
    fileprivate let heartRate : HeartRate?
    fileprivate let cadence : Cadence?
    fileprivate let sensorState : SensorState?
    
    public init(time : TCXDate, position : Position? = nil, altitude : Double? = nil, distance : Double? = nil, heartRate : HeartRate? = nil, cadence : Cadence? = nil, sensorState : SensorState? = nil) {
        self.time = time
        self.position = position
        self.altitude = altitude
        self.distance = distance
        self.heartRate = heartRate
        self.cadence = cadence
        self.sensorState = sensorState
    }
}

extension Trackpoint : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Trackpoint>")
        serializer.print(line: "<Time>")
        time.serialize(to: serializer)
        serializer.print(line: "</Time>")
        position?.serialize(to: serializer)
        altitude.flatMap{ serializer.print(line: "<AltitudeMeters>\($0)</AltitudeMeters>") }
        distance.flatMap{ serializer.print(line: "<DistanceMeters>\($0)</DistanceMeters>") }
        heartRate.flatMap{
            serializer.print(line: "<HeartRateBpm>")
            $0.serialize(to: serializer)
            serializer.print(line: "</HeartRateBpm>")
        }
        cadence?.serialize(to: serializer)
        sensorState?.serialize(to: serializer)
        serializer.print(line: "</Trackpoint>")
    }
}

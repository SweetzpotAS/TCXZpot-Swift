//
//  Lap.swift
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

public struct Lap {
    fileprivate let startTime : TCXDate
    fileprivate let totalTime : Double
    fileprivate let distance : Double
    fileprivate let maximumSpeed : Double?
    fileprivate let calories : Int
    fileprivate let averageHeartRate : HeartRate?
    fileprivate let maximumHeartRate : HeartRate?
    fileprivate let intensity : Intensity
    fileprivate let cadence : Cadence?
    fileprivate let triggerMethod : TriggerMethod
    fileprivate let tracks : [Track]?
    fileprivate let notes : Notes?
    
    public init(startTime : TCXDate, totalTime : Double, distance : Double, maximumSpeed : Double? = nil, calories : Int, averageHeartRate : HeartRate? = nil, maximumHeartRate : HeartRate? = nil, intensity : Intensity, cadence : Cadence? = nil, triggerMethod : TriggerMethod, tracks : [Track]? = nil, notes : Notes? = nil) {
        self.startTime = startTime
        self.totalTime = totalTime
        self.distance = distance
        self.maximumSpeed = maximumSpeed
        self.calories = calories
        self.averageHeartRate = averageHeartRate
        self.maximumHeartRate = maximumHeartRate
        self.intensity = intensity
        self.cadence = cadence
        self.triggerMethod = triggerMethod
        self.tracks = tracks
        self.notes = notes
    }
    
    public init(startTime : TCXDate, totalTime : Double, distance : Double, maximumSpeed : Double? = nil, calories : Int, averageHeartRate : HeartRate? = nil, maximumHeartRate : HeartRate? = nil, intensity : Intensity, cadence : Cadence? = nil, triggerMethod : TriggerMethod, tracks : Track..., notes : Notes? = nil) {
        self.init(startTime: startTime,
                  totalTime: totalTime,
                  distance: distance,
                  maximumSpeed: maximumSpeed,
                  calories: calories,
                  averageHeartRate: averageHeartRate,
                  maximumHeartRate: maximumHeartRate,
                  intensity: intensity,
                  cadence: cadence,
                  triggerMethod: triggerMethod,
                  tracks: tracks,
                  notes: notes)
    }
}

extension Lap : TCXSerializable {
    public func serialize(to serializer: Serializer) {
        serializer.print(line: "<Lap StartTime=\"\(startTime.description)\">")
        serializer.print(line: "<TotalTimeSeconds>\(totalTime)</TotalTimeSeconds>")
        serializer.print(line: "<DistanceMeters>\(distance)</DistanceMeters>")
        maximumSpeed.flatMap{ serializer.print(line: "<MaximumSpeed>\($0)</MaximumSpeed>") }
        serializer.print(line: "<Calories>\(calories)</Calories>")
        averageHeartRate.flatMap{
            serializer.print(line: "<AverageHeartRateBpm>")
            $0.serialize(to: serializer)
            serializer.print(line: "</AverageHeartRateBpm>")
        }
        maximumHeartRate.flatMap{
            serializer.print(line: "<MaximumHeartRateBpm>")
            $0.serialize(to: serializer)
            serializer.print(line: "</MaximumHeartRateBpm>")
        }
        intensity.serialize(to: serializer)
        cadence?.serialize(to: serializer)
        triggerMethod.serialize(to: serializer)
        tracks?.forEach{ $0.serialize(to: serializer) }
        notes?.serialize(to: serializer)
        serializer.print(line: "</Lap>")
    }
}

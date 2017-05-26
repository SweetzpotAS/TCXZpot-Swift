# TCXZpot [![Build Status](https://travis-ci.org/SweetzpotAS/TCXZpot-Swift.svg?branch=master)](https://travis-ci.org/SweetzpotAS/TCXZpot-Swift)

A fluent Swift library to create TCX files. Please, note this is a Work In Process library that does not include all features supported in TCX yet. They will be added in future releases.

For a detailed specification of the TCX format, visit [Garmin specification](http://www8.garmin.com/xmlschemas/TrainingCenterDatabasev2.xsd).

### Supported features

The root of a TCX file is a `TrainingCenterDatabase` which can have children of multiple types. The supported ones are:

- ❌ Folders
- ✅ Activities
- ❌ Workouts
- ❌ Courses
- ✅ Author
- ❌ Extensions

Within the supported modules, everything has been implemented except Extensions.

### Sample

You can easily create TCX files with a fluent syntax in TCXZpot:

``` swift
let db = TrainingCenterDatabase(activities:
                                    Activities(with:
                                        Activity(id: TCXDate(day: 10, month: 2, year: 2017, hour: 10, minute: 42, second: 0)!,
                                                 laps: [Lap(startTime: TCXDate(day: 10, month: 2, year: 2017, hour: 10, minute: 42, second: 0)!,
                                                           totalTime: 3000,
                                                           distance: 1200,
                                                           calories: 100,
                                                           intensity: .active,
                                                           triggerMethod: .manual,
                                                           tracks: Track(with:
                                                                Trackpoint(time: TCXDate(day: 10, month: 2, year: 2017, hour: 10, minute: 42, second: 0)!,
                                                                           position: Position(latitude: -3.6714, longitude: 36.8936)),
                                                                Trackpoint(time: TCXDate(day: 10, month: 2, year: 2017, hour: 10, minute: 42, second: 43)!,
                                                                      position: Position(latitude: -3.6727, longitude: 36.8946)),
                                                                Trackpoint(time: TCXDate(day: 10, month: 2, year: 2017, hour: 10, minute: 43, second: 20)!,
                                                                           position: Position(latitude: -3.6733, longitude: 36.901))
                                                                )
                                                        )],
                                                 notes: Notes(text: "A sample session"),
                                                 creator: Device(name: "BreathZpot Sensor",
                                                                 unitID: 1,
                                                                 productID: 1234567,
                                                                 version: Version(versionMajor: 1, versionMinor: 0)),
                                                 sport: .running)),
                                author:
                                    Application(name: "BreathZpot",
                                                build: Build(version: Version(versionMajor: 1, versionMinor: 0)),
                                                languageID: "en",
                                                partNumber: "123-45678-90"))
let serializer = FileSerializer()
db.serialize(to: serializer)
serializer.save(toPath : "path/to/file") // Can throw SerializationError.fileNotSaved
```


## License

    Copyright 2017 SweetZpot AS

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

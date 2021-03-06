//
//  TVShow.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import Genome

struct TVShow: BasicMappable {
    
    private(set) var id: Int!
    private(set) var name: String!
    private(set) var summary: String?
    private(set) var posterURL: NSURL?
    private(set) var scheduleDay: [String]?
    private(set) var scheduleTime: String?
    private(set) var genres: [String]?
    private(set) var episodes: [Episode]?
    
    mutating func sequence(map: Map) throws {
        try id           <~ map["id"]
        try name         <~ map["name"]
        try summary      <~ map["summary"]
        try posterURL    <~ map["image.original"].transformFromJson {
            return NSURL(string: $0)
        }
        try scheduleDay  <~ map["schedule.days"]
        try scheduleTime <~ map["schedule.time"]
        try genres       <~ map["genres"]
        try episodes     <~ map["_embedded.episodes"]
    }
    
}

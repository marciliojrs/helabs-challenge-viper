//
//  Episode.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/5/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import Genome
import SwiftDate

struct Episode: BasicMappable {
    
    private(set) var id: Int!
    private(set) var name: String!
    private(set) var number: Int!
    private(set) var season: Int!
    private(set) var summary: String?
    private(set) var imageURL: NSURL?
    private(set) var airDate: NSDate?
    private(set) var airTime: String?
    
    mutating func sequence(map: Map) throws {
        try id          <~ map["id"]
        try name        <~ map["name"]
        try number      <~ map["number"]
        try season      <~ map["season"]
        try summary     <~ map["summary"]
        try imageURL    <~ map["image.original"].transformFromJson { (input: String?) -> NSURL? in
            guard let path = input else {
                return nil
            }
            
            return NSURL(string: path)
        }
        try airDate     <~ map["airdate"].transformFromJson { (input: String) -> NSDate? in
            return NSDate.date(fromString: input, format: .Custom("yyyy-MM-dd"))
        }
        try airTime     <~ map["airtime"]
    }
    
}
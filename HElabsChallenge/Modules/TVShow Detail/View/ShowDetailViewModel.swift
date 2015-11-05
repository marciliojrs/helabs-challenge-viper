//
//  ShowDetailViewModel.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/5/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

struct ShowDetailViewModel {
    
    let name: String
    let posterURL: NSURL?
    let summary: String?
    let genres: [String]?
    let airOn: String?
    
    init(name: String, posterURL: NSURL?, summary: String?, genres: [String]?, airDays:[String]?, airTime: String?) {
        self.name       = name
        self.posterURL  = posterURL
        self.summary    = summary
        self.genres     = genres
        
        var days = airDays?.joinWithSeparator(",")
        if let d = days where d.characters.count > 0 {
            days = d.stringByAppendingString(" at ")
        }

        self.airOn  = days?.stringByAppendingString(airTime!)
    }
    
}
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
    let posterURL: NSURL
    let summary: String
    
    init(name: String, posterURL: NSURL, summary: String) {
        self.name       = name
        self.posterURL  = posterURL
        self.summary    = summary
    }
    
}
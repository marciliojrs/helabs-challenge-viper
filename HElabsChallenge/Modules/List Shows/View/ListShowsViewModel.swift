//
//  ListShowsViewModel.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

struct TVShowViewModel {
    
    let name: String
    let posterURL: NSURL
    
    init(name: String, posterURL: NSURL) {
        self.name       = name
        self.posterURL  = posterURL
    }
    
}
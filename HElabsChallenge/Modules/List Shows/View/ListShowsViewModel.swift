//
//  ListShowsViewModel.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

struct TVShowViewModel {
    
    let id: Int
    let name: String
    let posterURL: NSURL
    
    init(id: Int, name: String, posterURL: NSURL) {
        self.id         = id
        self.name       = name
        self.posterURL  = posterURL
    }
    
}
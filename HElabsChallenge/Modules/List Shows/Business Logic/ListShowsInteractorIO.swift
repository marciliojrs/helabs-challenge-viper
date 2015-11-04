//
//  ListShowsInteractorIO.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

protocol ListShowsInteractorInput: class {
    
    func fetchShows()
    
}

protocol ListShowsInteractorOutput: class {

    func handleFetchedShows(shows: [TVShow])
    
}

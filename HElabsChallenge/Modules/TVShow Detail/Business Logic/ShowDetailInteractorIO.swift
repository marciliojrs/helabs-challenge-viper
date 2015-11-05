//
//  ShowDetailInteractorIO.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

protocol ShowDetailInteractorInput: class {
 
    func fetchShowDetail(showId: Int)
    
}

protocol ShowDetailInteractorOutput: class {
    
    func handleFetchedShow(show: TVShow)
    
}

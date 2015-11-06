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
    func saveFavoriteShow(show: ShowDetailViewModel)
    
}

protocol ShowDetailInteractorOutput: class {
    
    func handleFetchedShow(show: TVShow, isFavorited: Bool)
    
}

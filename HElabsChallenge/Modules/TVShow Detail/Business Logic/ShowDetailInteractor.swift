//
//  ShowDetailInteractor.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

class ShowDetailInteractor: ShowDetailInteractorInput {
    
    // MARK: - Injected Properties
    
    weak var delegate: ShowDetailInteractorOutput?
    var dataManager: DataManagerInterface!
    
    // MARK - ShowDetailInteractorInput
    
    func fetchShowDetail(showId: Int) {
        dataManager.fetchShowWithId(showId) { (result) in
            switch result {
            case .Success(let show):
                self.delegate?.handleFetchedShow(show)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
}

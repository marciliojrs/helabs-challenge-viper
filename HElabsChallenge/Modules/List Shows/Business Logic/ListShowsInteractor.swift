//
//  ListShowsInteractor.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import Alamofire

class ListShowsInteractor: ListShowsInteractorInput {
    
    // MARK: - Injected Properties
    
    weak var delegate: ListShowsInteractorOutput?
    var dataManager: DataManagerInterface!
    var request: Alamofire.Request?
    
    // MARK: - ListShowsInteractorInput
    
    func fetchShows() {
        request = dataManager.fetchShows { (result) in
            switch result {
            case .Success(let shows):
                self.delegate?.handleFetchedShows(shows)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
}

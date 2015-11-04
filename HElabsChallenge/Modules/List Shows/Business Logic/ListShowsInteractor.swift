//
//  ListShowsInteractor.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

class ListShowsInteractor: ListShowsInteractorInput {
    
    // MARK: - Injected Properties -
    
    weak var delegate: ListShowsInteractorOutput?
    var dataManager: DataManagerInterface!
    
}

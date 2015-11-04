//
//  ListShowsPresenter.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

class ListShowsPresenter: ListShowsInteractorOutput {
    
    // MARK: - Injected Properties -
    
    var interactor: ListShowsInteractorInput?
    weak var listWireframe: ListShowsWireframe?
    weak var interface: ListShowsInterface?
//    weak var detailWireframe: PostDetailWireframe?
    
}

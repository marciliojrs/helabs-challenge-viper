//
//  FavoritesListPresenter.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/9/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

class FavoritesListPresenter {
    
    // MARK: - Injected Properties
    
    weak var wireframe: FavoritesWireframe?
    
    // MARK: - Methods
    
    func handleCellSelectionForShow(showId: Int) {
        wireframe?.presentShowDetailWithId(showId)
    }

}
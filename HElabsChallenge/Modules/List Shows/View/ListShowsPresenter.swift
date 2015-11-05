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
 
    // MARK: - Methods
    
    func loadShowsFromServer() {
        interactor?.fetchShows()
    }
    
    func handleCellSelectionForShow(show: TVShowViewModel) {
        listWireframe?.presentTVShowDetailWithId(show.id)
    }
    
    // MARK: - ListShowsInteractorOutput
    
    func handleFetchedShows(shows: [TVShow]) {
        let transformedShows = shows.map { (show) -> TVShowViewModel in
            return TVShowViewModel(id: show.id, name: show.name, posterURL: show.posterURL!)
        }
        
        interface?.setTVShowsDataSource(transformedShows)
    }
    
}

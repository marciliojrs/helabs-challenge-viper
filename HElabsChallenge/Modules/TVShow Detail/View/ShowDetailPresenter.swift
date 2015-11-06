//
//  ShowDetailPresenter.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation

class ShowDetailPresenter: ShowDetailInteractorOutput {
    
    // MARK: - Injected Properties -
    
    var interactor: ShowDetailInteractorInput?
    weak var detailWireframe: ShowDetailWireframe?
    weak var interface: ShowDetailInterface?
    
    // MARK: - Methods
    
    func fetchShowDetailWithId(showId: Int) {
        interactor?.fetchShowDetail(showId)
        interface?.bindTVShow(nil)
    }
    
    func saveFavoriteShow(viewModel: ShowDetailViewModel) {
        interactor?.saveFavoriteShow(viewModel)
    }
    
    // MARK: - ListShowsInteractorOutput
    
    func handleFetchedShow(show: TVShow) {
        let viewModel = ShowDetailViewModel(id: show.id,
            name: show.name,
            posterURL: show.posterURL,
            summary: show.summary,
            genres: show.genres,
            airDays: show.scheduleDay,
            airTime: show.scheduleTime,
            episodes: show.episodes)
        
        interface?.bindTVShow(viewModel)
    }
        
}

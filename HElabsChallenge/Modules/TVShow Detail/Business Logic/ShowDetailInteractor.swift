//
//  ShowDetailInteractor.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import JSQCoreDataKit
import CoreData

class ShowDetailInteractor: ShowDetailInteractorInput {
    
    // MARK: - Injected Properties
    
    weak var delegate: ShowDetailInteractorOutput?
    var dataManager: DataManagerInterface!
    
    // MARK - ShowDetailInteractorInput
    
    func fetchShowDetail(showId: Int) {
        dataManager.fetchShowWithId(showId) { (result) in
            switch result {
            case .Success(let show):
                let isFavorited = self.checkIfShowIsFavorited(showId)
                self.delegate?.handleFetchedShow(show, isFavorited: isFavorited)
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    func saveFavoriteShow(show: ShowDetailViewModel) {
        let favoriteShow = NSEntityDescription.insertNewObjectForEntityForName(FavoriteShowModel.entityName, inManagedObjectContext: CoreDataStack.defaultStack!.mainContext) as? FavoriteShowModel
        favoriteShow?.id   = show.id
        favoriteShow?.name = show.name
        
        saveContext(CoreDataStack.defaultStack!.mainContext) { (result) in
            switch result {
            case .Success: break
            case .Failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Helper
    
    private func checkIfShowIsFavorited(showId: Int) -> Bool {
        let favoriteShow = entity(name: FavoriteShowModel.entityName, context: CoreDataStack.defaultStack!.mainContext)
        let request = FetchRequest<FavoriteShowModel>(entity: favoriteShow)
        request.predicate = NSPredicate(format: "id = %@", argumentArray: [showId])
        
        var isFavorite: Bool
        do {
            let results = try fetch(request: request, inContext: CoreDataStack.defaultStack!.mainContext)
            isFavorite = results.count > 0
        }
        catch {
            isFavorite = false
        }
        
        return isFavorite
    }
    
}

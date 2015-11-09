//
//  FavoritesWireframe.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/6/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import UIKit

class FavoritesWireframe {
    
    // MARK: - Injected Properties
    
    var viewController: FavoritesListInterface?
    var rootWireframe: RootWireframe?
    var showDetailWireframe: ShowDetailWireframe?
    
    // MARK: - Navigation Flow Control
    
    func addFavoritesAtTabBarInWindow(window: UIWindow) {
        let navigationController = UINavigationController(rootViewController: viewController as! UIViewController)
        navigationController.tabBarItem.title = "Favorites"
        
        rootWireframe?.addNewViewController(navigationController, inTabBarFromWindow: window)
    }
    
    func presentShowDetailWithId(showId: Int) {
        showDetailWireframe?.pushDetailForShowId(showId, fromNavigationController: (viewController as! UIViewController).navigationController!)
    }
    
}
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
    
    var viewController: FavoritesVC?
    var rootWireframe: RootWireframe?
    
    // MARK: - Navigation Flow Control
    
    func addFavoritesAtTabBarInWindow(window: UIWindow) {
        let navigationController = UINavigationController(rootViewController: viewController!)
        navigationController.tabBarItem.title = "Favorites"
        
        rootWireframe?.addNewViewController(navigationController, inTabBarFromWindow: window)
    }
    
}
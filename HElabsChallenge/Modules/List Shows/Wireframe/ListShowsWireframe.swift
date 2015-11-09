//
//  ListShowsWireframe.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import UIKit

class ListShowsWireframe {

    // MARK: - Injected Properties
    
    var rootWireframe: RootWireframe?
    var showDetailWireframe: ShowDetailWireframe?
    var viewController: ListShowsInterface?
    
    // MARK: - Navigation Flow Control
    
    func addListShowsAtTabBarInWindow(window: UIWindow) {
        let navigationController = UINavigationController(rootViewController: viewController as! UIViewController)
        navigationController.tabBarItem.title = "TV Shows"
        
        rootWireframe?.addNewViewController(navigationController, inTabBarFromWindow: window)
    }
    
    func presentTVShowDetailWithId(showId: Int) {
        showDetailWireframe?.pushDetailForShowId(showId, fromNavigationController: (viewController as! UIViewController).navigationController!)
    }
    
}

//
//  AppDelegate.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15
//  Copyright (c) 2015 HElabs. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var listShowsWireframe: ListShowsWireframe?
    var favoritesWireframe: FavoritesWireframe?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        listShowsWireframe = DIContainer.sharedInstance.container.resolve(ListShowsWireframe.self)
        favoritesWireframe = DIContainer.sharedInstance.container.resolve(FavoritesWireframe.self)
        
        listShowsWireframe?.addListShowsAtTabBarInWindow(window!)
        favoritesWireframe?.addFavoritesAtTabBarInWindow(window!)
        
        return true
    }
    
}

//
//  RootWireframe.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import UIKit

struct RootWireframe {
    
    func addNewViewController(viewController: UIViewController, inTabBarFromWindow window: UIWindow) {
        let tabBarController = tabBarControllerFromWindow(window)
        
        var viewControllers = tabBarController.viewControllers
        if viewControllers == nil {
            viewControllers = []
        }
        viewControllers?.append(viewController)
        
        tabBarController.viewControllers = viewControllers
    }
    
    func tabBarControllerFromWindow(window: UIWindow) -> UITabBarController {
        let tabBarController = window.rootViewController as! UITabBarController
        return tabBarController
    }
    
}

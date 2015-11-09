//
//  ShowDetailWireframe.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import UIKit

class ShowDetailWireframe {

    // MARK: - Injected Properties
    
    var viewController: ShowDetailInterface?
    
    // MARK: - Methods
    
    func pushDetailForShowId(showId: Int, fromNavigationController navigationController: UINavigationController) {
        viewController?.configureControllerForShowWithId(showId)
        navigationController.pushViewController(viewController as! UIViewController, animated: true)
    }
    
}

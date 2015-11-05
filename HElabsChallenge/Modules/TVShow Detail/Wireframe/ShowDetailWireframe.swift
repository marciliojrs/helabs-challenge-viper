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
    
    var detailViewController: ShowDetailVC?
    
    // MARK: - Methods
    
    func pushDetailForShowId(showId: Int, fromNavigationController navigationController: UINavigationController) {
        detailViewController!.showId = showId
        navigationController.pushViewController(detailViewController!, animated: true)
    }
    
}

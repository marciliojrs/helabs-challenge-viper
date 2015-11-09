//
//  FavoritesVC.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/6/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import UIKit

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

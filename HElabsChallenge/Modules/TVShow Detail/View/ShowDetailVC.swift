//
//  ShowDetailVC.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import UIKit
import Nuke
import TagListView

class ShowDetailVC: UIViewController, ShowDetailInterface, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Injected Properties
    
    var presenter: ShowDetailPresenter?
    
    // MARK: - Outlets
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var airOnLabel: UILabel!
    @IBOutlet weak var tagListView: TagListView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var sections: [Int: [ShowDetailEpisodeViewModel]]?
 
    // MARK: - ShowDetailInterface
    
    func configureControllerForShowWithId(showId: Int) {
        _ = view
        presenter?.fetchShowDetailWithId(showId)
    }
    
    func bindTVShow(viewModel: ShowDetailViewModel?) {
        guard let viewModel = viewModel else {
            clearScreen()
            
            return
        }
        
        posterImageView.nk_prepareForReuse()
        posterImageView.nk_setImageWithURL(viewModel.posterURL!)
        
        nameLabel.text  = viewModel.name
        airOnLabel.text = viewModel.airOn
        
        if let genres = viewModel.genres {
            for genre in genres {
                tagListView.addTag(genre)
            }
        }
        
        sections = viewModel.sections
        tableView.reloadData()
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        guard let sections = sections else {
            return 0
        }
        
        return sections.keys.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = sections else {
            return 0
        }
        
        let episodes = sections[section + 1]
        return episodes!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("EpisodeCellIdentifier", forIndexPath: indexPath)
        
        let episodes = sections![indexPath.section + 1]
        let model = episodes![indexPath.row]
        cell.textLabel?.text = model.name
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season \(section + 1)"
    }
    
    // MARK: - Helper
    
    func clearScreen() {
        posterImageView.image   = nil
        nameLabel.text          = ""
        airOnLabel.text         = ""
        
        tagListView.removeAllTags()
        
        sections = nil
        tableView.reloadData()
    }
    
}

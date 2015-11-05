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

class ShowDetailVC: UIViewController, ShowDetailInterface {

    // MARK: - Injected Properties
    
    var presenter: ShowDetailPresenter?
    
    // MARK: - Outlets
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var airOnLabel: UILabel!
    @IBOutlet weak var tagListView: TagListView!
    
    // MARK: - Properties
    
    var showId: Int?

    // MARK: - View Life Cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.fetchShowDetailWithId(showId!)
    }
 
    // MARK: - ShowDetailInterface
    
    func bindTVShow(viewModel: ShowDetailViewModel?) {
        guard let viewModel = viewModel else {
            posterImageView.image   = nil
            nameLabel.text          = ""
            airOnLabel.text         = ""
            tagListView.removeAllTags()
            
            return
        }
        
        posterImageView.nk_prepareForReuse()
        posterImageView.nk_setImageWithURL(viewModel.posterURL!)
        
        nameLabel.text = viewModel.name
        airOnLabel.text = viewModel.airOn
        
        if let genres = viewModel.genres {
            for genre in genres {
                tagListView.addTag(genre)
            }
        }
    }
    
}

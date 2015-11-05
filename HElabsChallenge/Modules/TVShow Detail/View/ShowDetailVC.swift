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

class ShowDetailVC: UIViewController, ShowDetailInterface {

    // MARK: - Injected Properties
    
    var presenter: ShowDetailPresenter?
    
    // MARK: - Outlets
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
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
            posterImageView.image = nil
            nameLabel.text = ""
            summaryLabel.text = ""
            
            return
        }
        
        posterImageView.nk_prepareForReuse()
        posterImageView.nk_setImageWithURL(viewModel.posterURL)
        
        nameLabel.text = viewModel.name
        summaryLabel.text = viewModel.summary
    }
    
}

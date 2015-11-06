//
//  ListShowsVC.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import UIKit
import Nuke

class ListShowsVC: UIViewController, ListShowsInterface, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Injected Properties

    var presenter: ListShowsPresenter?
    
    // MARK: - Properties
    
    var shows = [TVShowViewModel]()
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "TV Shows"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        presenter?.loadShowsFromServer()
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shows.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ShowCollectionCell", forIndexPath: indexPath) as! TVShowCell
        
        let model = shows[indexPath.row]
        
        cell.nameLabel.text = model.name
        cell.posterImageView.nk_prepareForReuse()
        cell.posterImageView.nk_setImageWithURL(model.posterURL)
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let model = shows[indexPath.row]
        
        presenter?.handleCellSelectionForShow(model)
    }
    
    func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        (cell as! TVShowCell).posterImageView.nk_prepareForReuse()
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenWidth = collectionView.bounds.width
        let itemSpacing = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).minimumInteritemSpacing as CGFloat
        
        let expectedNumberOfItemsPerLine = 3 as CGFloat
        let necessarySpaceForInteritemSpacingPerLine = expectedNumberOfItemsPerLine * itemSpacing
        
        let expectedCellWidth = (screenWidth - necessarySpaceForInteritemSpacingPerLine) / expectedNumberOfItemsPerLine
        
        return CGSize(width: expectedCellWidth, height: 160)
    }
    
    // MARK: - ListShowsInterface
    
    func setTVShowsDataSource(dataSource: [TVShowViewModel]) {
        shows = dataSource
        collectionView.reloadData()
    }
    
}

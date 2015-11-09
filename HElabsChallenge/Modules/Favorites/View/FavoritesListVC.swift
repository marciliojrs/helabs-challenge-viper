//
//  FavoritesVC.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/6/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import UIKit
import CoreData
import JSQCoreDataKit

class FavoritesListVC: UIViewController, FavoritesListInterface, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    // MARK: - Injected Properties
    
    var presenter: FavoritesListPresenter?
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var fetchedResultsController: NSFetchedResultsController?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFetchedResultsController()
        
        title = "Favorites"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }
    }
    
    // MARK: - Helper
    
    func setupFetchedResultsController() {
        let favoriteShowEntity = entity(name: "FavoriteShow", context: CoreDataStack.defaultStack!.mainContext)
        let fetchRequest = FetchRequest(entity: favoriteShowEntity)
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataStack.defaultStack!.mainContext, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
        
        do {
            try fetchedResultsController?.performFetch()
        }
        catch (let error) {
            print(error)
        }
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController!.fetchedObjects!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let favoriteModel = fetchedResultsController?.objectAtIndexPath(indexPath) as! FavoriteShowModel
        
        cell.textLabel?.text = favoriteModel.name
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let favoriteModel = fetchedResultsController?.objectAtIndexPath(indexPath) as! FavoriteShowModel
        
        presenter?.handleCellSelectionForShow(favoriteModel.id)
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
}

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

class FavoritesVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var fetchedResultsController: NSFetchedResultsController?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFetchedResultsController()
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
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
        
        let object = fetchedResultsController?.objectAtIndexPath(indexPath) as! FavoriteShowModel
        
        cell.textLabel?.text = object.name
        
        return cell
    }
    
    // MARK: - NSFetchedResultsControllerDelegate
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
}

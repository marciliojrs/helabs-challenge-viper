//
//  FavoriteShowModel.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/6/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import CoreData

class FavoriteShowModel: NSManagedObject {

    @NSManaged var id: Int
    @NSManaged var name: String
    
    class var entityName: String {
        return "FavoriteShow"
    }
    
}

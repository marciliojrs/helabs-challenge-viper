//
//  CoreDataStack.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/6/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import JSQCoreDataKit

extension CoreDataStack {

    static let defaultStack = CoreDataStack.createStack()
    
    private class func createStack() -> CoreDataStack? {
        let model = CoreDataModel(name: "HElabsChallengeModel", bundle: NSBundle.mainBundle(), storeType: .InMemory)
        let factory = CoreDataStackFactory(model: model)
        
        switch factory.createStack() {
        case .Success(let stack):
            return stack
        case .Failure(let error):
            print(error)
            return nil
        }
    }
    
}
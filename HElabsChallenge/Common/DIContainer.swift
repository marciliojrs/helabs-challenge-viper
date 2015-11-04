//
//  DIContainer.swift
//  HElabsChallenge
//
//  Created by Marcilio Junior on 11/4/15.
//  Copyright © 2015 HElabs. All rights reserved.
//

import Foundation
import Swinject

struct DIContainer {
    
    static let sharedInstance = DIContainer()
    let container = Container()
    
    init() {
        commonInjections()
        listShowsModuleInjections()
    }
    
    private func commonInjections() {
        container.register(RootWireframe.self) { _ in RootWireframe() }
        container.register(APIClient.self) { _ in APIClient() }
        
        container.register(SwinjectStoryboard.self) { _ in
            SwinjectStoryboard.create(name: "Main", bundle: NSBundle.mainBundle(), container: self.container)            
        }.inObjectScope(ObjectScope.Container)
    }
    
    private func listShowsModuleInjections() {
        let storyboard = SwinjectStoryboard.create(name: "ListShows", bundle: NSBundle.mainBundle(), container: self.container)
        
        container.register(ListShowsVC.self) { (r) in
            let controller = storyboard.instantiateViewControllerWithIdentifier("ListShowsViewIdentifier") as! ListShowsVC
            controller.presenter = r.resolve(ListShowsPresenter.self)
            
            return controller
        }
        
        container.register(ListShowsWireframe.self) { (r) in
            let wireframe = ListShowsWireframe()
            
            wireframe.listShowsViewController = r.resolve(ListShowsVC.self)
            wireframe.rootWireframe = r.resolve(RootWireframe.self)
//            wireframe.postDetailWireframe = r.resolve(PostDetailWireframe.self)
            
            return wireframe
        }
        
        container.register(ListShowsInteractor.self) { (r) in
            let interactor = ListShowsInteractor()
            
            interactor.dataManager = r.resolve(APIClient.self)
            
            return interactor
        }.initCompleted { (r, interactor) in
            interactor.delegate = r.resolve(ListShowsPresenter.self)
        }
        
        container.register(ListShowsPresenter.self) { (r) in
            let presenter = ListShowsPresenter()
            
            presenter.interactor = r.resolve(ListShowsInteractor.self)
            
            return presenter
        }.initCompleted { (r, presenter) in
            presenter.interface = r.resolve(ListShowsVC.self)
            presenter.listWireframe = r.resolve(ListShowsWireframe.self)
//                presenter.detailWireframe = r.resolve(PostDetailWireframe.self)
        }
    }
    
}

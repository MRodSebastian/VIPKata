//
//  ListHeroeFactory.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 5/4/22.
//

import Foundation

class ListHeroeFactory {
    public static func list() -> ListHeroeViewController {
        let viewController = ListHeroeViewController()
        let interactor = ListHeroeInteractor(listWorker: ListHeroeWorker())
        let presenter = ListHeroePresenter()
        let router = ListHeroeRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        router.viewController = viewController
        
        return viewController
    }
}

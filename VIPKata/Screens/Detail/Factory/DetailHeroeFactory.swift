//
//  DetailHeroeFactory.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import Foundation

class DetailHeroeFactory {
    public static func detail(heroe: Heroe) -> DetailHeroeViewController {
        let viewController = DetailHeroeViewController()
        let interactor = DetailHeroeInteractor(heroe: heroe, detailWorker: DetailHeroeWorker())
        let presenter = DetailHeroePresenter()
        let router = DetailHeroeRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        
        return viewController
    }
}

//
//  ListHeroeRouter.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 5/4/22.
//

import UIKit

class ListHeroeRouter {
    weak var viewController: UIViewController?
}

extension ListHeroeRouter: ListHeroeRouterInterface {
    func present(heroe: Heroe) {
        let detailViewController = DetailHeroeFactory.detail(heroe: heroe)
        
        let navigationController = UINavigationController(rootViewController: detailViewController)
        navigationController.isNavigationBarHidden = true
        viewController?.present(navigationController, animated: true, completion: nil)
    }
}

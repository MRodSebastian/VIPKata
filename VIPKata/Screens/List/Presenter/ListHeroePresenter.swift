//
//  ListHeroePresenter.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 5/4/22.
//

import UIKit

class ListHeroePresenter: NSObject {
    weak var viewController: ListHeroePresenterOutput?
}

extension ListHeroePresenter: ListHeroePresenterInput {
    func didLoadList() {
        viewController?.dismissHud()
        viewController?.reloadData()
    }
    
    func didFailed() {
        viewController?.dismissHud()
    }
    
    func didSelectHeroe(heroe: Heroe) {
        viewController?.selectedHeroe(heroe: heroe)
    }
}

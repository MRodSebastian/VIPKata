//
//  DetailHeroePresenter.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import Foundation
import UIKit

class DetailHeroePresenter: NSObject {
    weak var viewController: DetailHeroePresenterOutput?
}

extension DetailHeroePresenter: DetailHeroeInteractorOutput {
    func didLoadHeroe(heroe: Heroe) {
        DispatchQueue.main.async { [weak self] in
            let viewModel = DetailHeroeViewModel(withHeroe: heroe)
            self?.viewController?.reloadHeroeInfo(withViewModel: viewModel)
        }
    }
    
    func didLoadComics(comicsList: List<Comic>) {
        DispatchQueue.main.async { [weak self] in
            let viewModel = DetailHeroeComicsViewModel(withList: comicsList)
            self?.viewController?.dismissHud()
            self?.viewController?.reloadComics(withViewModel: viewModel)
        }
    }
    
    func didFailed() {
        viewController?.dismissHud()
    }
}

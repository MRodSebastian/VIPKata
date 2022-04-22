//
//  DetailHeroViewControllerInterface.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import UIKit

protocol DetailHeroeViewControllerInput: AnyObject {
    func showHud()
    func dismissHud()
    func reloadHeroeInfo(withViewModel viewModel: DetailHeroeViewModel)
    func reloadComics(withViewModel viewModel: DetailHeroeComicsViewModel)
}

protocol DetailHeroeViewControllerOutput: UICollectionViewDataSource {
    func loadInfo() async
}

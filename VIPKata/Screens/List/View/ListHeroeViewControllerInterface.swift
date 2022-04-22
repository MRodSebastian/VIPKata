//
//  ListHeroeViewControllerInterface.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 5/4/22.
//

import UIKit

protocol ListHeroeViewControllerInput: AnyObject {
    func showHud()
    func dismissHud()
    func reloadData()
    func selectedHeroe(heroe: Heroe)
}

protocol ListHeroeViewControllerOutput: UITableViewDataSource {
    func loadData() async
    func didSelectItem(atIndexPath indexPath: IndexPath)
}

//
//  ListHeroeInteractor.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 5/4/22.
//

import Foundation
import UIKit

class ListHeroeInteractor: NSObject {
    var presenter: ListHeroePresenterInput?
    var listWorker: ListHeroeWorkerInterface
    
    private var isLoading: Bool = false
    
    init(listWorker: ListHeroeWorkerInterface) {
        self.listWorker = listWorker
    }
    
    private var list = List<Heroe>(offset: 0, limit: 20, total: 0, count: 0, results: [])
    
    private var numberOfItems: Int {
        return list.results.count
    }
    
    private var canLoadMore: Bool {
        guard !isLoading else { return false }
        
        return numberOfItems != list.total
    }
    
    private func heroe(atIndexPath indexPath: IndexPath) -> Heroe {
        return list.results[indexPath.row]
    }
}

extension ListHeroeInteractor: ListHeroeInteractorInput {
    func loadData() async {
        do {
            isLoading = true
            let params = HeroeQueryDTO(limit: list.limit, offset: numberOfItems)
            async let newList = listWorker.loadLists(withParams: params)

            list = try await list.updating(newList: newList)
            
            presenter?.didLoadList()
            isLoading = false
        } catch {
            presenter?.didFailed()
        }
    }
    
    func didSelectItem(atIndexPath indexPath: IndexPath) {
        let heroe = heroe(atIndexPath: indexPath)
        presenter?.didSelectHeroe(heroe: heroe)
    }
}

extension ListHeroeInteractor: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeroeTableViewCell.self), for: indexPath) as! HeroeTableViewCell
        let heroe = heroe(atIndexPath: indexPath)
        cell.viewModel = HeroCellViewModel(heroe: heroe)
        
        if indexPath.row == numberOfItems - 1 && canLoadMore {
            Task {
                await loadData()
            }
        }
        
        return cell
    }
}

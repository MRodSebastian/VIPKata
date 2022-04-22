//
//  DetailHeroeInteractor.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import UIKit

class DetailHeroeInteractor: NSObject {
    var presenter: DetailHeroeInteractorOutput?
    var detailWorker: DetailHeroeWorkerInterface
    
    private var heroe: Heroe
    private var comicsList: List<Comic> = List(offset: 0, limit: 20, total: 0, count: 0, results: [])
    
    init(heroe: Heroe, detailWorker: DetailHeroeWorkerInterface) {
        self.heroe = heroe
        self.detailWorker = detailWorker
    }
    
    private var numberOfComics: Int {
        return comicsList.results.count
    }
    
    private var totalComics: Int {
        return comicsList.total
    }
    
    private var canLoadMoreComics: Bool {
        return numberOfComics != comicsList.total
    }
    
    private func comic(atIndexPath indexPath: IndexPath) -> Comic {
        return comicsList.results[indexPath.row]
    }
}

extension DetailHeroeInteractor: DetailHeroeInteractorInput {
    func loadInfo() async {
        do {
            let heroeIdentifier = "\(heroe.id)"
            async let newHeroe = detailWorker.loadHeroe(withIdentifier: heroeIdentifier)
            async let newComicsList = detailWorker.loadComics(withHeroeIdentifier: heroeIdentifier)
            
            heroe = try await newHeroe
            comicsList = try await comicsList.updating(newList: newComicsList)
            
            presenter?.didLoadHeroe(heroe: heroe)
            presenter?.didLoadComics(comicsList: comicsList)
        } catch {
            presenter?.didFailed()
        }
    }
}

extension DetailHeroeInteractor: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfComics
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ComicCollectionViewCell.self), for: indexPath) as! ComicCollectionViewCell
        let comic = comic(atIndexPath: indexPath)
        cell.viewModel = ComicCellViewModel(comic: comic)
        return cell
    }
}

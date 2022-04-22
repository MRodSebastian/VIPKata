//
//  DetailHeroeViewController.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import UIKit

class DetailHeroeViewController: UIViewController {
    var interactor: DetailHeroeInteractorInput?
    var router: DetailHeroeRouterInterface?
    
    @IBOutlet weak var heroImageView: UIImageView! {
        didSet {
            heroImageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var heroeNameLabel: UILabel!
    @IBOutlet weak var heroeDescriptionLabel: UILabel!
    
    @IBOutlet weak var comicsLabel: UILabel!
    @IBOutlet weak var comicsCollectionView: UICollectionView! {
        didSet {
            comicsCollectionView.delegate = self
            comicsCollectionView.dataSource = interactor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comicsCollectionView.register(ComicCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ComicCollectionViewCell.self))
        comicsCollectionView.register(UINib(nibName: String(describing: ComicCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: ComicCollectionViewCell.self))
        
        showHud()
        
        Task {
            await interactor?.loadInfo()
        }
    }
}

extension DetailHeroeViewController: DetailHeroePresenterOutput {
    func showHud() {
        ProgressHUD.show()
    }
    
    func dismissHud() {
        ProgressHUD.dismiss()
    }
    
    func reloadHeroeInfo(withViewModel viewModel: DetailHeroeViewModel) {
        if let imageURL = viewModel.imageURL {
            heroImageView.image(withURL: imageURL)
        }
        heroeNameLabel.text = viewModel.name
        heroeDescriptionLabel.text = viewModel.description
        heroeDescriptionLabel.isHidden = viewModel.hideDescription
    }
    
    func reloadComics(withViewModel viewModel: DetailHeroeComicsViewModel) {
        comicsLabel.text = viewModel.comicsSectionTitle
        comicsCollectionView.reloadData()
    }
}

extension DetailHeroeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint(indexPath)
    }
}

extension DetailHeroeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 140, height: 200)
    }
}

//
//  ListHeroeViewController.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 5/4/22.
//

import UIKit

class ListHeroeViewController: UIViewController {
    var interactor: ListHeroeInteractorInput?
    var router: ListHeroeRouterInterface?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = interactor
            tableView.separatorStyle = .none
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(HeroeTableViewCell.self, forCellReuseIdentifier: String(describing: HeroeTableViewCell.self))
        tableView.register(UINib(nibName: String(describing: HeroeTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: HeroeTableViewCell.self))
        
        showHud()
                
        Task {
            await interactor?.loadData()
        }
    }
}

extension ListHeroeViewController: ListHeroeViewControllerInput {
    func showHud() {
        ProgressHUD.show()
    }
    
    func dismissHud() {
        ProgressHUD.dismiss()
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func selectedHeroe(heroe: Heroe) {
        router?.present(heroe: heroe)
    }
}

extension ListHeroeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor?.didSelectItem(atIndexPath: indexPath)
    }
}

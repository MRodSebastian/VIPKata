//
//  HeroeTableViewCell.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 11/4/22.
//

import UIKit

class HeroeTableViewCell: UITableViewCell {
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var backgroundImageView: UIImageView! {
        didSet {
            backgroundImageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var heroeImageView: UIImageView! {
        didSet {
            heroeImageView.contentMode = .scaleToFill
        }
    }
    
    @IBOutlet weak var heroeNameLabel: UILabel! {
        didSet {
            heroeNameLabel.numberOfLines = 1
            heroeNameLabel.minimumScaleFactor = 0.7
        }
    }
    
    @IBOutlet weak var heroeDescriptionLabel: UILabel! {
        didSet {
            heroeDescriptionLabel.numberOfLines = 2
            heroeDescriptionLabel.minimumScaleFactor = 0.5
        }
    }

    public var viewModel: HeroCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            updateView(withViewModel: viewModel)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 12.0
        containerView.layer.masksToBounds = true
    }
    
    private func updateView(withViewModel viewModel: HeroCellViewModel) {
        heroeNameLabel.text = viewModel.name
        heroeDescriptionLabel.text = viewModel.description
        
        if let imageURL = viewModel.imageURL {
            heroeImageView.image(withURL: imageURL)
            backgroundImageView.image(withURL: imageURL)
        } else {
            heroeImageView.image = nil
            backgroundImageView.image = nil
        }
    }
}

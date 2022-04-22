//
//  ComicCollectionViewCell.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import UIKit

class ComicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var comicImageView: UIImageView! {
        didSet {
            comicImageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var comicTitleLabel: UILabel! {
        didSet {
            comicTitleLabel.numberOfLines = 2
        }
    }
    
    @IBOutlet weak var gradientContentView: UIView! {
        didSet {
            gradientContentView.backgroundColor = .clear
        }
    }
    
    public var viewModel: ComicCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            
            update(withViewModel: viewModel)
        }
    }
    
    private var gradientLayer: CAGradientLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if gradientLayer == nil {
            gradientLayer = CAGradientLayer()
            gradientLayer?.frame = gradientContentView.bounds
            gradientLayer?.colors = [
                UIColor.white.withAlphaComponent(0.1).cgColor,
                UIColor.white.withAlphaComponent(0.8).cgColor
            ]
            gradientContentView.layer.insertSublayer(gradientLayer!, at: 0)
        }
    }
    
    private func update(withViewModel viewModel: ComicCellViewModel) {
        if let imageURL = viewModel.imageURL {
            comicImageView.image(withURL: imageURL)
        }
        
        comicTitleLabel.text = viewModel.title
    }

}

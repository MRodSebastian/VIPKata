//
//  UIImage+Extensions.swift
//  VIPKata
//
//  Created by Manuel Rodriguez on 13/4/22.
//

import UIKit
import SDWebImage

extension UIImageView {
    public func image(withURL url: URL, placeholder: UIImage? = nil) {
        self.sd_setImage(with: url, placeholderImage: placeholder)
    }
}

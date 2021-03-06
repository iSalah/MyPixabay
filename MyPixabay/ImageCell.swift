//
//  ImageCell.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation
import UIKit

class ImageCell: UICollectionViewCell {
    
    static let identifier = "ImageCell"
    static let loadingIdentifier = "LoadingCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setupContent(fromImage image: Image) {
        imageView.image = UIImage(named: "defaultImage")
        imageView.loadImageFrom(url: image.previewUrl)
    }
    
}

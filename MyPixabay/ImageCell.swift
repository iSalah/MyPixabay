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
    
    @IBOutlet weak var imageView: UIImageView!
    
    func setupContent(fromImage image: Image) {
        imageView.image = nil
        imageView.loadImageFrom(url: image.url)
    }
    
}

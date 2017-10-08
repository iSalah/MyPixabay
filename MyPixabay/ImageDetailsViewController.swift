//
//  ImageDetailsViewController.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation
import UIKit

class ImageDetailsViewController: UITableViewController {
    
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var favoritesLabel: UILabel!
    @IBOutlet weak var viewsLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    @IBOutlet weak var downloadsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var image: Image?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContent()
    }
    
    func setupContent() {
        guard let image = image else { return }
        imageView.image = UIImage(named: "defaultImage")
        imageView.loadImageFrom(url: image.url)
        tagsLabel.text = "\(image.tags)"
        widthLabel.text = "\(image.width)px"
        heightLabel.text = "\(image.height)px"
        likesLabel.text = "\(image.likes)"
        favoritesLabel.text = "\(image.favorites)"
        viewsLabel.text = "\(image.views)"
        commentsLabel.text = "\(image.comments)"
        downloadsLabel.text = "\(image.downloads)"
    }
    
}

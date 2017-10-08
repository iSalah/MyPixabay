//
//  SearchViewController.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = [Image]()
    var page = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
    }
    
}


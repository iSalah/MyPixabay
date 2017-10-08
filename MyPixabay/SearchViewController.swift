//
//  SearchViewController.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = [Image]()
    var page = 1
    var shouldLoadMoreImages = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func fetchImages() {
        Image.fetch(withQuery: self.searchBar.text ?? "") { images in
            guard let images = images else { return }
            self.images = images
            self.page = 1
            self.shouldLoadMoreImages = true
            self.collectionView.reloadData()
        }
    }
    
    func paginateImages() {
        self.page += 1
        Image.fetch(withQuery: self.searchBar.text ?? "", page: self.page) { images in
            self.images += images ?? []
            self.shouldLoadMoreImages = (images?.count ?? 0) > 0 ? true : false
            self.collectionView.reloadData()
        }
    }
}


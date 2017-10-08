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
    @IBOutlet weak var submitButton: UIBarButtonItem!
    
    var images = [Image]()
    var selectedImages = [Image]() {
        didSet {
            self.submitButton.isEnabled = selectedImages.count > 0
        }
    }
    var page = 1
    var shouldLoadMoreImages = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.allowsSelection = true
        self.collectionView.allowsMultipleSelection = true
        setupUI()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowImagesSegue" {
            let imagesViewController = segue.destination as? ImagesViewController
            imagesViewController?.images = selectedImages
        }
    }
    
    func setupUI() {
        self.submitButton.isEnabled = false
    }
    
    func fetchImages() {
        clearSelection()
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
    
    func clearSelection() {
        selectedImages = []
        guard let indexPathsForSelectedItems = self.collectionView.indexPathsForSelectedItems else { return }
        for indexPath in indexPathsForSelectedItems {
            self.collectionView.deselectItem(at: indexPath, animated:false)
            if let cell = self.collectionView.cellForItem(at: indexPath) {
                cell.layer.borderWidth = 0
            }
        }
    }
}


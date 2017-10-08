//
//  SearchViewController+SearchBar.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.page = 1
        Image.fetch(withQuery: searchText) { images in
            guard let images = images else { return }
            self.images = images
            self.collectionView.reloadData()
        }
    }
    
}

//
//  SearchViewController+Cells.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count + (shouldLoadMoreImages ? 1 : 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row < images.count else {
            self.paginateImages()
            return collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.loadingIdentifier, for: indexPath)
        }

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
        cell.setupContent(fromImage: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let defaultImageWidth: Double = 100
        let numberOfItemsInSingleRow = floor(Double(self.view.bounds.width) / defaultImageWidth)
        let spaceLeft = Double(self.view.bounds.width) - (numberOfItemsInSingleRow * defaultImageWidth)
        let imageWidth = defaultImageWidth + (spaceLeft / numberOfItemsInSingleRow)
        return CGSize(width: imageWidth, height: imageWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        guard indexPath.row < self.images.count else { return false }
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedImages.append(self.images[indexPath.row])
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 4.0
        cell?.layer.borderColor = UIColor.blue.cgColor
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let image = self.images[indexPath.row]
        if let index = self.selectedImages.index(where: {$0.id == image.id}) {
            self.selectedImages.remove(at: index)
        }
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderWidth = 0.0
    }
    
}

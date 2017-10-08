//
//  ImagesViewController.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation
import UIKit

class ImagesViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var images = [Image]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = true
        self.configurePageControl()
        self.setScrollViewContent()
    }
    
    func setScrollViewContent() {
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        var previousImageView: UIImageView?
        for image in self.images {
            let imageView = UIImageView()
            imageView.loadImageFrom(url: image.url)
            imageView.contentMode = .scaleAspectFill
            previousImageView = imageView
            contentView.addSubview(imageView)
            
            var constraints = [NSLayoutConstraint]()
            constraints.append(NSLayoutConstraint(item: imageView, attribute: .width, relatedBy: .equal, toItem: self.scrollView, attribute: .width, multiplier: 1, constant: 0))
            constraints.append(NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: self.scrollView, attribute: .height, multiplier: 1, constant: 0))
            
            let index = self.images.index(where: { $0.id == image.id })
            if let index = index, index == 0 {
                constraints.append(NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self.scrollView, attribute: .leading, multiplier: 1, constant: 0))
            }
            if let index = index, index == (images.count - 1) {
                constraints.append(NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self.scrollView, attribute: .trailing, multiplier: 1, constant: 0))
            }
            if let previousImageView = previousImageView {
                constraints.append(NSLayoutConstraint(item: previousImageView, attribute: .trailing, relatedBy: .equal, toItem: imageView, attribute: .leading, multiplier: 1, constant: 0))
            }
            self.scrollView.addConstraints(constraints)
        }
        
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.size.width * CGFloat(self.images.count), height: self.scrollView.frame.size.height)
        pageControl.addTarget(self, action: #selector(self.changePage), for: UIControlEvents.valueChanged)
    }
    
    func configurePageControl() {
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        self.pageControl.currentPageIndicatorTintColor = UIColor.blue
    }
    
    func changePage() {
        let x = CGFloat(self.pageControl.currentPage) * self.scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        self.pageControl.currentPage = Int(pageNumber)
    }
}

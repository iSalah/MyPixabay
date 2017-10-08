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
        self.scrollView.backgroundColor = UIColor.black
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        for image in self.images {
            addImageView(fromImage: image)
        }
        
        self.scrollView.contentSize = CGSize(width:self.scrollView.frame.size.width * CGFloat(self.images.count), height: self.scrollView.frame.size.height)
        pageControl.addTarget(self, action: #selector(self.changePage), for: UIControlEvents.valueChanged)
    }
    
    private func addImageView(fromImage image: Image) {
        let previousImageView = self.scrollView.subviews.last
        let imageView = UIImageView()
        imageView.loadImageFrom(url: image.url)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = UIColor.black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.addSubview(imageView)
        
        let index = self.images.index(where: { $0.id == image.id })
        let isFirst = index != nil && index! == 0
        let isLast = index != nil && index! == (self.images.count - 1)
        
        let vFormat = "V:|[image]|"
        var hFormat = "H:\(isFirst ? "|" : "")"
        hFormat = "\(hFormat)\(previousImageView != nil ? "[prevImage]" : "")"
        hFormat = "\(hFormat)[image(==scrollView)]"
        hFormat = "\(hFormat)\(isLast ? "|" : "")"
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vFormat, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["image":imageView]))
        self.scrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: hFormat, options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["image":imageView, "prevImage": previousImageView, "scrollView": scrollView]))
        self.scrollView.addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self.scrollView, attribute: .centerY, multiplier: 1, constant: 0))
    }
    
    private func configurePageControl() {
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
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

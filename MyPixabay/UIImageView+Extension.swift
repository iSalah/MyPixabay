//
//  UIImageView+Extension.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadImageFrom(url: String) {
        RequestManager.get(url: url) { data in
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }
    }
    
}

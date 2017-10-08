//
//  Image.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation

class Image {
    var url: String
    
    init?(fromDictionary dict: [String:Any]) {
        guard let url = dict["webformatURL"] as? String else { return nil }
        self.url = url
    }
}

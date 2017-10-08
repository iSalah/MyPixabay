//
//  Image.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation

class Image {
    var id: Int
    var url: String
    var previewUrl: String
    
    init?(fromDictionary dict: [String:Any]) {
        guard let url = dict["webformatURL"] as? String else { return nil }
        guard let previewUrl = dict["previewURL"] as? String else { return nil }
        guard let id = dict["id"] as? Int else { return nil }
        self.url = url
        self.previewUrl = previewUrl
        self.id = id
    }
}

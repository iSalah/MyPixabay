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
    
    var likes = 0
    var favorites = 0
    var views = 0
    var comments = 0
    var downloads = 0
    
    var tags = ""
    var width: Int
    var height: Int
    
    init?(fromDictionary dict: [String:Any]) {
        guard let url = dict["webformatURL"] as? String else { return nil }
        guard let previewUrl = dict["previewURL"] as? String else { return nil }
        guard let id = dict["id"] as? Int else { return nil }
        guard let width = dict["imageWidth"] as? Int else { return nil }
        guard let height = dict["imageHeight"] as? Int else { return nil }
        
        self.url = url
        self.previewUrl = previewUrl
        self.id = id
        self.width = width
        self.height = height
        self.likes = dict["likes"] as? Int ?? 0
        self.favorites = dict["favorites"] as? Int ?? 0
        self.views = dict["views"] as? Int ?? 0
        self.comments = dict["comments"] as? Int ?? 0
        self.downloads = dict["downloads"] as? Int ?? 0
        self.tags = dict["tags"] as? String ?? ""
    }
}

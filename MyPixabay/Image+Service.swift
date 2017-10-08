//
//  Image+Service.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation

extension Image {
    
    class func fetch(withQuery query: String, page: Int = 1, completion: @escaping ([Image]?)->()) {
        let url = "https://pixabay.com/api/?key=\(AppConfig.PixabayAPIKey)&q=\(query)&page=\(page)"
        RequestManager.get(url: url) { data in
            guard let data = data else { return completion(nil) }
            guard let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else { return completion(nil) }
            guard let json = jsonData as? [String:Any] else { return completion(nil) }
            guard let items = json["hits"] as? [[String:Any]] else { return completion(nil) }

            let images = items.map({Image(fromDictionary: $0)}).flatMap({$0})
            completion(images)
        }
    }
    
}

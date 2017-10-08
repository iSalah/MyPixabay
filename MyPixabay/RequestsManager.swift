//
//  RequestsManager.swift
//  MyPixabay
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation
//
//  HTTPRequestManager.swift
//  TestRequests
//
//  Created by Salah Kaci on 08/10/2017.
//  Copyright © 2017 Salah Kaci. All rights reserved.
//

import Foundation

class RequestManager {
    
    class func get(url: String, withCompletion completion: @escaping (Data?) -> Void) {
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: OperationQueue.main)
        let url = URL(string: url)!
        session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { return completion(nil) }
            guard error == nil else { return completion(nil) }
            completion(data)
        }).resume()
    }

}

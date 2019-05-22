//
//  APIHandler.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation
import Alamofire

struct APIHandler {
    
    private static func request(url: URLConvertible, method: HTTPMethod, success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        Alamofire.request(url, method: method).responseData { (response) in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    private static func request(_ request: URLRequest, success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        Alamofire.request(request).responseData { (response) in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    static func getFruits(success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        APIHandler.request(url: Constants.Api.fruits, method: .get, success: success, failure: failure)
    }
    
    /// Fetch entries from the API
    ///
    /// - Parameters:
    ///   - success: Closure taking the datas reveived from the API
    ///   - failure: Closure taking the error received from the API
    static func getEntries(success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        APIHandler.request(url: Constants.Api.entries, method: .get, success: success, failure: failure)
    }
    
    static func addEntry(forDateString dateString: String, success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        guard let url = URL(string: Constants.Api.entries) else {
            print("[Error]: addEntry -> Can't construct URL from string \(Constants.Api.entries)")
            return
        }
        
        let data = Constants.dateJsonTemplate(withDateString: dateString).data(using: .utf8)!
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = data
        
        APIHandler.request(request, success: success, failure: failure)
    }
}

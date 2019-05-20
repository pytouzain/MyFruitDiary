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
    
    private static func request(url: URLConvertible, success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        Alamofire.request(url, method: .get).responseData { (response) in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    static func getFruits(success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        APIHandler.request(url: Constants.Api.fruits, success: success, failure: failure)
    }
    
    /// Fetch entries from the API
    ///
    /// - Parameters:
    ///   - success: Closure taking the datas reveived from the API
    ///   - failure: Closure taking the error received from the API
    static func getEntries(success: @escaping (Data)->(), failure: @escaping (Error)->()) {
        APIHandler.request(url: Constants.Api.entries, success: success, failure: failure)
    }
}

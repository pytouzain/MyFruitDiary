//
//  Constants.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation

struct Constants {
    struct Urls {
        static let base = "https://fruitdiary.test.themobilelife.com"
    }
    
    struct Api {
        static let baseApi = "https://fruitdiary.test.themobilelife.com/api"
        static let entries = "\(baseApi)/entries"
        static let fruits = "\(baseApi)/fruit"
    }
    
    static func dateJsonTemplate(withDateString dateString: String) -> String {
        return "{\"date\":\"\(dateString)\"}"
    }
}

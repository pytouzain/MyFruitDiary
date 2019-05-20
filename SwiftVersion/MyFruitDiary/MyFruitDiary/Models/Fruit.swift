//
//  Fruit.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation
import RealmSwift

class Fruit: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case vitamins
        case imageUrlString = "image"
    }
    
    var id: Int
    var type: String
    var vitamins: Int
    var imageUrlString: String
}

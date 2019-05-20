//
//  FruitAmount.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation

struct FruitAmount: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id = "fruitId"
        case type = "fruitType"
        case amount
    }
    
    var id: Int
    var type: String
    var amount: Int
}

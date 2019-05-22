//
//  Entry.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation

struct Entry: Codable {
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case fruits = "fruit"
    }
    
    var id: Int
    var date: String
    var fruits: [FruitAmount]
    
    func totalAmountOfFruits() -> Int {
        return fruits.compactMap { $0.amount }.reduce(0, +)
    }
    
    func totalAmountOfVitamins() -> Int {
        return fruits.compactMap { DataManager.shared.getFruit(forId: $0.id) }.compactMap { $0.vitamins }.reduce(0, +)
    }
}

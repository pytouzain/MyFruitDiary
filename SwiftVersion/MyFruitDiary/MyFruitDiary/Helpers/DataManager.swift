//
//  DataManager.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    var fruits: [Fruit] = []
    
    func getFruit(forId id: Int) -> Fruit? {
        return fruits.filter { $0.id == id }.first
    }
}

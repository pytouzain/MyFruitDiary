//
//  FruitCell.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 22/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit
import SDWebImage

class FruitCell: UITableViewCell {

    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var vitaminsLabel: UILabel!
    
    func configure(withFruit fruit: Fruit) {
        fruitImageView.sd_setImage(with: URL(string: "\(Constants.Urls.base)/\(fruit.imageUrlString)"), completed: nil)
        typeLabel.text = fruit.type
        vitaminsLabel.text = "\(fruit.vitamins) vitamins"
    }
}

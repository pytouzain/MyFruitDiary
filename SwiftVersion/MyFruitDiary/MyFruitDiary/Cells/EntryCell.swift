//
//  EntryCell.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class EntryCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalOfFruitsLabel: UILabel!
    @IBOutlet weak var amountOfVitaminsLabel: UILabel!
    
    func configure(withEntry entry: Entry) {
        dateLabel.text = entry.date
        totalOfFruitsLabel.text = "\(entry.totalAmountOfFruits()) fruits eaten"
        amountOfVitaminsLabel.text = "\(entry.totalAmountOfVitamins()) vitamins"
    }
    
}

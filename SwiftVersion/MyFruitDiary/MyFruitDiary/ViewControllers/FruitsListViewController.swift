//
//  FruitsListViewController.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 22/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class FruitsListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FruitCell", bundle: nil), forCellReuseIdentifier: "FruitCell_ID")
        tableView.tableFooterView = UIView()
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.fruits.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FruitCell_ID", for: indexPath) as? FruitCell {
            cell.configure(withFruit: DataManager.shared.fruits[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}

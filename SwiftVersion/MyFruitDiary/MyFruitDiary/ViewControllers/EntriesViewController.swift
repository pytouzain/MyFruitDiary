//
//  EntriesViewController.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class EntriesViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var entries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setNavigationBar()
        requestEntries()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "EntryCell", bundle: nil), forCellReuseIdentifier: "EntryCell_ID")
        tableView.tableFooterView = UIView()
    }
    
    private func setNavigationBar() {
        navigationController?.navigationItem.title = "Test"
    }
    
    private func requestEntries() {
        APIHandler.getEntries(success: { (data) in
            let decoder = JSONDecoder()
            self.entries = (try? decoder.decode([Entry].self, from: data)) ?? []
            print("ENTRIES: \(self.entries)")
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell_ID", for: indexPath) as? EntryCell {
            cell.textLabel?.text = entries[indexPath.row].date
            return cell
        }
        return UITableViewCell()
    }

}

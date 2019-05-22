//
//  EntriesViewController.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class EntriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var entries: [Entry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setNavigationBar()
        requestEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "EntryCell", bundle: nil), forCellReuseIdentifier: "EntryCell_ID")
        tableView.tableFooterView = UIView()
    }
    
    private func setNavigationBar() {
        let btn1 = UIButton(type: .contactAdd)
        btn1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btn1.addTarget(self, action: #selector(EntriesViewController.addEntry), for: .touchUpInside)
        let item1 = UIBarButtonItem(customView: btn1)
        self.navigationItem.setRightBarButtonItems([item1], animated: true)
        
        let leftButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.plain, target: self, action: #selector(EntriesViewController.showEditing))
        self.navigationItem.setLeftBarButton(leftButton, animated: false)
    }
    
    private func requestEntries() {
        APIHandler.getEntries(success: { (data) in
            let decoder = JSONDecoder()
            self.entries = (try? decoder.decode([Entry].self, from: data)) ?? []
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
    }
    
    @objc func showEditing()
    {
        if(self.tableView.isEditing == true)
        {
            self.tableView.isEditing = false
            self.navigationItem.leftBarButtonItem?.title = "Edit"
        }
        else
        {
            self.tableView.isEditing = true
            self.navigationItem.leftBarButtonItem?.title = "Done"
        }
    }
    
    @objc func addEntry() {
        APIHandler.addEntry(forDateString: "2019-04-20", success: { (data) in
            print("SUCCESS")
            let decoder = JSONDecoder()
            let entry = try? decoder.decode(Entry.self, from: data)
            print(entry?.id ?? 0)
        }) { (error) in
            print(error)
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell_ID", for: indexPath) as? EntryCell {
            cell.configure(withEntry: entries[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        Navigation.shared.presentFruitsList()
    }
}

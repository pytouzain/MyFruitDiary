//
//  LoadingFruitViewController.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import UIKit

class LoadingFruitViewController: UIViewController {

    @IBOutlet weak var activityView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestFruits()
    }

    func requestFruits() {
        print("[Log]: Start requesting fruits")
        defer {
            print("[Log]: Stop requesting fruits")
        }
        
        activityView.startAnimating()
        APIHandler.getFruits(success: { (data) in
            let decoder = JSONDecoder()
            DataManager.shared.fruits = (try? decoder.decode([Fruit].self, from: data)) ?? []
            self.activityView.stopAnimating()
            Navigation.shared.presentTabBarController()
        }) { (error) in
            print(error)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

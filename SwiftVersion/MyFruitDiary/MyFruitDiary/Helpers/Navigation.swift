//
//  Navigation.swift
//  MyFruitDiary
//
//  Created by Pierre-Yves Touzain on 20/05/2019.
//  Copyright © 2019 TYP Studio. All rights reserved.
//

import Foundation
import UIKit

class Navigation {
    
    static let shared = Navigation()
    
    weak var window: UIWindow!
    
    private var entriesNavigationController: UINavigationController? {
        let tabBarController = window.rootViewController as? UITabBarController
        guard tabBarController?.viewControllers?.isEmpty == false else {
            print("[Error]: No items founded in tabBarController.viewControllers")
            return nil
        }
        return tabBarController?.viewControllers?[0] as? UINavigationController
    }
    
    func presentTabBarController() {
        let tabBarController = UITabBarController()
        
        let entriesViewController = EntriesViewController()
        let navigationController = UINavigationController(rootViewController: entriesViewController)
        
        let aboutViewController = AboutViewController()
        
        aboutViewController.tabBarItem.title = "About"
        navigationController.tabBarItem.title = "My Diary"
        
        tabBarController.viewControllers = [navigationController, aboutViewController]
        window.rootViewController = tabBarController
    }
    
    func presentLoadingFruits() {
        let loadingFruitViewController = LoadingFruitViewController()
        window.rootViewController = loadingFruitViewController
    }
    
    func presentFruitsList() {
        let fruitsListViewController = FruitsListViewController()
        entriesNavigationController?.pushViewController(fruitsListViewController, animated: true)
    }
}

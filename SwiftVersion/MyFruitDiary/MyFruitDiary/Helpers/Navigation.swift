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
}

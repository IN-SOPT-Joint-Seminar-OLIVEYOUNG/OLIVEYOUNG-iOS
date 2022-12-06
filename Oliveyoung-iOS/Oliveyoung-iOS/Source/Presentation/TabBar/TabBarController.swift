//
//  TabBarController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/25.
//

import UIKit

import SnapKit
import Then

final class TabBarController: UITabBarController {
    
    // MARK: - Properties
    
    private var tabs: [UIViewController] = []
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarAppearance()
        setTabBarItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
}

// MARK: - Functions

extension TabBarController {
    
    private func setTabBarAppearance() {
        UITabBar.appearance().tintColor = .willaGrayGray500
        tabBar.barTintColor = .white

//        tabBar.layer.borderWidth = 0.5
//        tabBar.layer.borderColor = UIColor.willaGrayGray500.cgColor
    }
    
    private func setTabBarItems() {
        
        tabs = [
            HomeViewController(),
            SearchViewController(),
//            SearchResultViewController(),
            ImageSearchResultViewController(),
            DetailViewController()
        ]
        
        TabBarItem.allCases.forEach {
            tabs[$0.rawValue].tabBarItem = $0.asTabBarItem()
            tabs[$0.rawValue].tabBarItem.tag = $0.rawValue
        }
        
        setViewControllers(tabs, animated: true)
    }
}
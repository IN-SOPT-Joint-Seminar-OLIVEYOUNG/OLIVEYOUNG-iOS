//
//  TabBarItem.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/25.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case home
    case like
    case mypage
    case category
}

extension TabBarItem {
    var title: String {
        switch self {
        case .home:
            return "홈"
        case .like:
            return "찜한 상품"
        case .mypage:
            return "마이 페이지"
        case .category:
            return "카테고리"
        }
    }

    
    var inactiveIcon: UIImage? {
        switch self {
        case .home:
            return Const.Image.home_icon_line
        case .like:
            return Const.Image.like_icon_line
        case .mypage:
            return Const.Image.mypage_icon_line
        case .category:
            return Const.Image.category_icon
        }
    }
    
    var activeIcon: UIImage? {
        switch self {
        case .home:
            return Const.Image.hoem_icon
        case .like:
            return Const.Image.like_icon
        case .mypage:
            return Const.Image.mypage_icon
        case .category:
            return Const.Image.category_icon
        }
    }
}

extension TabBarItem {
    public func asTabBarItem() -> UITabBarItem {
        return UITabBarItem(
            title: title,
            image: inactiveIcon,
            selectedImage: activeIcon
        )
    }
}

//
//  SearchViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/16.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class SearchViewController: UIViewController {
    // MARK: - Property
    
    // MARK: - Component
    let backButton = UIButton(type: .custom).then {
        $0.setImage(Const.Image.back, for: .normal)
    }
    let searchBar = UITextField().then {
        $0.placeholder = "상품을 검색해보세요"
        $0.autocorrectionType = .no
    }
    let searchButton = UIButton(type: .custom).then {
        $0.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 12)
        $0.setImage(Const.Image.searchIcon24X24, for: .normal)
    }
    let searchHeader = UIView()
    let searchArea = UIView().then {
        $0.layer.cornerRadius = 18
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.willa.cgColor
        $0.backgroundColor = UIColor.clear
    }

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    

    // MARK: - Function
    private func setUI() {
        view.backgroundColor = .white
    }
    private func setLayout() {
        searchArea.addSubviews(searchBar, searchButton)
        searchHeader.addSubviews(backButton, searchArea)
        view.addSubviews(searchHeader)
        
        searchHeader.snp.makeConstraints {
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(15)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(2)
            $0.height.equalTo(36)
        }
        backButton.snp.makeConstraints {
            $0.width.equalTo(backButton.snp.height).multipliedBy(1)
            $0.leading.equalTo(searchHeader)
            $0.centerY.equalTo(searchArea)
        }
        searchArea.snp.makeConstraints {
            $0.leading.equalTo(backButton.snp.trailing).offset(14)
            $0.top.bottom.trailing.equalTo(searchHeader)
            $0.height.equalTo(36)
        }
        searchButton.snp.makeConstraints {
            $0.width.equalTo(searchButton.snp.height).multipliedBy(1)
            $0.trailing.equalTo(searchArea.snp.trailing).inset(15)
            $0.centerY.equalTo(searchArea)
        }
        searchBar.snp.makeConstraints {
            $0.height.equalTo(36)
            $0.leading.equalTo(searchArea.snp.leading).inset(12)
            $0.trailing.equalTo(searchButton.snp.leading)
        }
    }
    
    // MARK: - Objc Function

}

struct ViewControllerPreView:PreviewProvider {
    static var previews: some View {
        SearchViewController().toPreview()
    }
}

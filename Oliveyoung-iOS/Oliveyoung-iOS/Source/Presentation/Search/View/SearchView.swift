//
//  SearchView.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class SearchView: BaseView {
    
    private lazy var navigationView = SearchNavigationView()
  
    lazy var collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: UICollectionViewFlowLayout()).then {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = false
        $0.collectionViewLayout = layout
        
        $0.register(PopularWordCollectionViewCell.self,
                    forCellWithReuseIdentifier: Const.Identifier.PopularWordCollectionViewCell)
        $0.register(RecentWordCollectionViewCell.self,
                    forCellWithReuseIdentifier: Const.Identifier.RecentWordCollectionViewCell)
        $0.register(SearchSectionView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: Const.Identifier.SearchSectionView)
    }

    override func setView() {
        [navigationView, collectionView]
            .forEach { addSubview($0) }
    }
    
    override func setLayout() {
        navigationView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.height.equalTo(40)
            $0.width.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.equalTo(safeAreaInsets).inset(15)
            $0.bottom.equalTo(safeAreaInsets)
        }
    }
}


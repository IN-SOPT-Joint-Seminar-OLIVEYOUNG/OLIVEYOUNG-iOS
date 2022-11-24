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

final class SearchViewController: BaseViewController {
    // MARK: - Property
    
    // MARK: - Component
    private lazy var searchView = SearchView()
    
    private var recentWordDummy = Word.recentWordDummy()
    private var popularWordDummy = Word.popularWordDummy()
    
    // MARK: - LifeCycle
    override func loadView() {
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionView()
    }
    
}

extension SearchViewController {
    private func registerCollectionView() {
        searchView.collectionView.delegate = self
        searchView.collectionView.dataSource = self
    }
}

extension SearchViewController: UICollectionViewDelegate {}

extension SearchViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
            
        case 0:
            return recentWordDummy.count
        default:
            return popularWordDummy.count
//        default:
//            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.Identifier.RecentWordCollectionViewCell, for: indexPath) as? RecentWordCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configureUI(word: recentWordDummy[indexPath.row])
            
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.Identifier.PopularWordCollectionViewCell, for: indexPath) as? PopularWordCollectionViewCell else { return UICollectionViewCell() }
            
            cell.configureUI(word: popularWordDummy[indexPath.row])
            
            return cell
//        default:
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
//
//            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SearchSectionView.identifier,
            for: indexPath
        ) as? SearchSectionView else { return UICollectionReusableView() }
        
        headerView.setTitle(text: SearchSection(index: indexPath.section).headerTitle)
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0)
        default:
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 40)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: recentWordDummy[indexPath.item].word.size(withAttributes: [NSAttributedString.Key.font: UIFont.bodyBody5]).width + 20, height: 24)
        default:
            return CGSize(width: popularWordDummy[indexPath.item].word.size(withAttributes: [NSAttributedString.Key.font: UIFont.bodyBody5]).width + 20, height: 24)
//        default:
//            return CGSize(width: UIScreen.main.bounds.width - 40, height: 95)
        }
    }
}

//struct ViewControllerPreView:PreviewProvider {
//    static var previews: some View {
//        SearchViewController().toPreview()
//    }
//}

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
import Moya

final class SearchViewController: BaseViewController {
    
    // MARK: - Property
    private let searchProvider = MoyaProvider<SearchRouter>(plugins: [MoyaLoggingPlugin()])
    private var recommendList: [Product] = []
    private var recentWordList: [String] = Word.setRecentWordDummy()
    private var popularWordDummy = Word.popularWordDummy()
    private var recommendDummyList: [RecommendModel] = [
        RecommendModel(Image: "beyond", Brand: "비욘드", Name: "엔젤 아쿠아 수분 진정 크림",Price: "20,800원",Percent: "16%"),
        RecommendModel(Image: "hince", Brand: "힌스", Name: "무드 인핸서 마뜨",Price: "12,321원",Percent: "32%"),
        RecommendModel(Image: "3ce", Brand: "3CE", Name: "치명립스틱",Price: "60,000원",Percent: "16%"),
        
    ]
    
    // MARK: - Component
    private lazy var searchView = SearchView()
    
    // MARK: - Server Helpers
    private func getSearch() {
        searchProvider.request(.getSearch) { result in
            switch result {
            case .success(let response):
                let status = response.statusCode
                let data = response.data
                let networkResult = NetworkBase.judgeStatus(by: status, data, SearchMainResponse.self)
                switch networkResult {
                case .success(let data):
                    guard let data = data as? SearchMainResponse else { return }
                    self.recommendList = data.products
                    self.recentWordList = data.recentWords
                    self.searchView.collectionView.reloadData()
                case .requestErr(_):
                    self.recentWordList = Word.setRecentWordDummy()
                    print("requestErr")
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: - LifeCycle
    override func loadView() {
        self.view = searchView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getSearch()
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        switch section {
            
        case 0:
            return recentWordList.count
        case 1:
            return popularWordDummy.count
        default:
            return recommendDummyList.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.Identifier.RecentWordCollectionViewCell, for: indexPath) as? RecentWordCollectionViewCell else { return UICollectionViewCell() }
            cell.configureUI(word: recentWordList[indexPath.row])
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Const.Identifier.PopularWordCollectionViewCell, for: indexPath) as? PopularWordCollectionViewCell else { return UICollectionViewCell() }
            cell.configureUI(word: popularWordDummy[indexPath.row])
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReccomendCollectionViewCell.identifier, for: indexPath) as? ReccomendCollectionViewCell else { return UICollectionViewCell() }
            cell.dataBind(model: recommendDummyList[indexPath.row])
            return cell
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
            return UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0)
        case 1:
            return UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
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
            return CGSize(width: recentWordList[indexPath.item].size(withAttributes: [NSAttributedString.Key.font: UIFont.bodyBody5]).width + 20, height: 24)
        case 1:
            return CGSize(width: popularWordDummy[indexPath.item].word.size(withAttributes: [NSAttributedString.Key.font: UIFont.bodyBody5]).width + 20, height: 24)
        default:
            let recInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - recInset.left - recInset.right - 15
            return CGSize(width: doubleCellWidth / 4, height: 192)
        }
    }
}

struct SearchViewControllerPreView:PreviewProvider {
    static var previews: some View {
        SearchViewController().toPreview()
    }
}

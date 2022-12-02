//
//  SearchResultViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/16.
//

import UIKit

class SearchResultViewController: UIViewController, UICollectionViewDataSource {
    
    var brandList: [BrandModel] = [
        BrandModel(Image: "drg", Brand: "비욘드"),
        BrandModel(Image: "urage", Brand: "유리아주"),
        BrandModel(Image: "nuxe", Brand: "넉스"),
        BrandModel(Image: "innerlab", Brand: "이너랩"),
        BrandModel(Image: "freemay", Brand: "프리메이"),
    ]
    var detailList: [RecommendModel] = [
        RecommendModel(Image: "drg_big", Brand: "닥터지", Name: "엔젤 아쿠아 수분 진정 크림",Price: "20,800원",Percent: "16%"),
        RecommendModel(Image: "bremish", Brand: "닥터지", Name: "무드 인핸서 마뜨",Price: "12,321원",Percent: "32%"),
        RecommendModel(Image: "oil", Brand: "닥터지", Name: "치명립스틱",Price: "60,000원",Percent: "16%"),
    ]
    
    private lazy var navigationView = SearchNavigationView()
    
    private lazy var dividerView = UIView().then {
        $0.backgroundColor = .willaGrayGray100
    }
    private lazy var brandCollectionView = UICollectionView().then { collectionView in
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    private lazy var itemCollectionView = UICollectionView().then { collectionView in
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    private func setView() {
        view.addSubviews(navigationView, dividerView, brandCollectionView, itemCollectionView)
    }
    private func setLayout() {
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(40)
            $0.width.equalToSuperview()
        }
        dividerView.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(7)
        }
    }
    
}

extension SearchResultViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case brandCollectionView:
            return brandList.count
        case itemCollectionView:
            return detailList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case brandCollectionView:
            guard let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath)
                    as? BrandCollectionViewCell else {return UICollectionViewCell() }
            brandCell.dataBind(model: brandList[indexPath.item])
            return brandCell
        default:
            guard let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReccomendCollectionViewCell.identifier, for: indexPath)
                    as? ReccomendCollectionViewCell else {return UICollectionViewCell() }
            detailCell.dataBind(model: detailList[indexPath.item])
            return detailCell
        }
    }
}

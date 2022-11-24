//
//  RecommendViewController.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/23.
//

import UIKit

class DViewController: UIViewController {
    private lazy var dCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
        var recommendList: [RecommendModel] = [
            RecommendModel(Image: "drg_big", Brand: "닥터지", Name: "엔젤 아쿠아 수분 진정 크림",Price: "20,800원",Percent: "16%"),
            RecommendModel(Image: "bremish", Brand: "닥터지", Name: "무드 인핸서 마뜨",Price: "12,321원",Percent: "32%"),
            RecommendModel(Image: "oil", Brand: "닥터지", Name: "치명립스틱",Price: "60,000원",Percent: "16%"),
           ]
    
    
    final let detailInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
    final let detailInterItemSpacing : CGFloat = 15
    final let detailLineSpacing : CGFloat = 16
    final let detailCellHeight : CGFloat = 192
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()

    }
}


//MARK: - Extensions

extension DViewController {
    
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(dCollectionView)
        dCollectionView.snp.makeConstraints {make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(230)
        }
    }
    private func register() {
        dCollectionView.register(ReccomendCollectionViewCell.self, forCellWithReuseIdentifier:
                                    ReccomendCollectionViewCell.identifier)
    }
}

extension DViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - detailInset.left - detailInset.right - detailInterItemSpacing
            return CGSize(width: doubleCellWidth / 4, height: 192)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return detailLineSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return detailInterItemSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return detailInset
        }
    
}

extension DViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReccomendCollectionViewCell.identifier, for: indexPath)
                as? ReccomendCollectionViewCell else {return UICollectionViewCell() }
        detailCell.dataBind(model: recommendList[indexPath.item])
        return detailCell
    }
}

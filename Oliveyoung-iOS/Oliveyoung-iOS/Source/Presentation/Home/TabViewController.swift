//
//  RecommendViewController.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/23.
//

import UIKit

class TabViewController: UIViewController {
    private lazy var tabCollectionView: UICollectionView = {
        
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
    
        var tabList: [TabModel] = [
            TabModel(Name: "추천"),TabModel(Name: "특가"),TabModel(Name: "랭킹"),TabModel(Name: "이벤트"),TabModel(Name: "세일") ]
    
    
    final let Inset : UIEdgeInsets = UIEdgeInsets(top:24 , left:15 , bottom: 12, right: 15)
    final let InterItemSpacing : CGFloat = 10
    final let LineSpacing : CGFloat = 3
    final let CellHeight : CGFloat = 17
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()

    }
}


//MARK: - Extensions

extension TabViewController {
    
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(tabCollectionView)
        tabCollectionView.snp.makeConstraints {make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(100)
        }
    }
    private func register() {
        tabCollectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier:
                                    TabCollectionViewCell.identifier)
    }
   
}

extension TabViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - Inset.left - Inset.right - InterItemSpacing
            return CGSize(width: doubleCellWidth / 6, height: 17)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return LineSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return InterItemSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return Inset
        }
    
}

extension TabViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath)
                as? TabCollectionViewCell else {return UICollectionViewCell() }
        Cell.dataBind(model: tabList[indexPath.item])
        return Cell
    }
}

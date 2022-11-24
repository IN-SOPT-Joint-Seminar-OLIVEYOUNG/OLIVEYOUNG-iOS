//
//  PracticeViewController.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/22.
//

import UIKit
import SnapKit
import Then

final class PracticeViewController: UIViewController {
    

    private lazy var menuCollectionView: UICollectionView = {
        
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
    
    
    //MARK: - Variables
    var menuList: [MenuModel] = [
        MenuModel(menuImage: "Rectangle 29", name: "카테고리"),
        MenuModel(menuImage: "col_2", name: "스킨케어"),
        MenuModel(menuImage: "col3", name: "바디케어"),
        MenuModel(menuImage: "col4", name: "헤어케어"),
        MenuModel(menuImage: "col5", name: "메이크업"),
        MenuModel(menuImage: "col5.5", name: "향수/디퓨저"),
        MenuModel(menuImage: "col6", name: "미용소품"),
        MenuModel(menuImage: "col7", name: "건강용품"),
        MenuModel(menuImage: "col8", name: "푸드"),
        MenuModel(menuImage: "col9", name: "라이프/홈")
        
    ]
    
    final let menuInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
    final let menuInterItemSpacing : CGFloat = 1
    final let menuLineSpacing : CGFloat = 16
    final let menuCellHeight : CGFloat = 75

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
    }
}


//MARK: - Extensions

extension PracticeViewController {
    
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(menuCollectionView)
        menuCollectionView.snp.makeConstraints {make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(230)
        }
    }
    private func register() {
        menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
    }
   
}

extension PracticeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - menuInset.left - menuInset.right - menuInterItemSpacing
            return CGSize(width: doubleCellWidth / 6, height: 75)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return menuLineSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return menuInterItemSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return menuInset
        }
    
}

extension PracticeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath)
                as? MenuCollectionViewCell else {return UICollectionViewCell() }
        menuCell.dataBind(model: menuList[indexPath.item])
        return menuCell
    }
}

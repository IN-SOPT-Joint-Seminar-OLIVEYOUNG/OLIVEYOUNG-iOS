//
//  menuCollectionViewController.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/20.
//

import UIKit

private let reuseIdentifier = "MenuCollectionViewCell"

class menuCollectionViewController: UICollectionViewController {
    private lazy var musicCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero,collectionViewLayout: flowLayout)
                collectionView.backgroundColor = .clear
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                return collectionView
    }()
    
    // MARK: - Variables
    var menuList: [MenuModel] = [
        MenuModel(menuImage: "Rectangle 29", menutitle: "카테고리"),
        MenuModel(menuImage: "col_2", menutitle: "스킨케어"),
        MenuModel(menuImage: "col3", menutitle: "바디케어"),
        MenuModel(menuImage: "col4", menutitle: "바디케어"),
        MenuModel(menuImage: "col5", menutitle: "바디케어"),
        MenuModel(menuImage: "col5.5", menutitle: "바디케어"),
        MenuModel(menuImage: "col6", menutitle: "바디케어"),
        MenuModel(menuImage: "col7", menutitle: "바디케어"),
        MenuModel(menuImage: "col8", menutitle: "바디케어"),
        MenuModel(menuImage: "col9", menutitle: "바디케어"),
    ]
    
    // MARK: - Constants
    final let menuInset : UIEdgeInsets = UIEdgeInsets(top: 49, left: 20, bottom: 10, right: 20)
    final let menuLineSpacing : CGFloat = 10
    final let menuInterItemSpacing : CGFloat = 21
    final let menuCellHeight:CGFloat =  75
    
    
    
    

    // MARK: - Extensions

    extension menuCollectionViewController {
        
        // MARK: - Layout Helpers
        
        private func layout() {
            view.backgroundColor = .white
            view.addSubview(menuCollectionViewController)
            menuCollectionViewController.snp.makeConstraints {
                $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
                $0.bottom.equalToSuperview()
                $0.height.equalTo(200)
            }
        }
        
        // MARK: - General Helpers
        
        private func register() {
            musicCollectionView.register(
                MusicCollectionViewCell.self,
                forCellWithReuseIdentifier: MusicCollectionViewCell.identifier
            )
        }
        
        private func calculateCellHeight() -> CGFloat {
            let count = CGFloat(musicList.count)
            let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
            return heightCount * kCellHeight + (heightCount - 1) * kMusicLineSpacing + kMusicInset.top + kMusicInset.bottom
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout

    extension MusicGridViewController: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - kMusicInset.left - kMusicInset.right - kMusicInterItemSpacing
            return CGSize(width: doubleCellWidth / 2, height: 198)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return kMusicLineSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return kMusicInterItemSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return kMusicInset
        }
    }

    // MARK: -UICollectionViewDataSource

    extension MusicGridViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return musicList.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let musicCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MusicCollectionViewCell.identifier, for: indexPath)
                    as? MusicCollectionViewCell else { return UICollectionViewCell() }
            musicCell.dataBind(model: musicList[indexPath.item])
            return musicCell
        }
    }
    
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
      
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    

    
        return cell
    }

    

}

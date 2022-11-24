//
//  RecommendViewController.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/23.
//

import UIKit

class BrandViewController: UIViewController {
    private lazy var brandCollectionView: UICollectionView = {
        
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
    
        var brandList: [BrandModel] = [
            BrandModel(Image: "drg", Brand: "비욘드"),
            BrandModel(Image: "urage", Brand: "유리아주"),
            BrandModel(Image: "nuxe", Brand: "넉스"),
            BrandModel(Image: "innerlab", Brand: "이너랩"),
            BrandModel(Image: "freemay", Brand: "프리메이"),
            
            
           ]
    
    
    final let Inset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
    final let InterItemSpacing : CGFloat = 12
    final let LineSpacing : CGFloat = 16
    final let CellHeight : CGFloat = 76
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()

    }
}


//MARK: - Extensions

extension BrandViewController {
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(brandCollectionView)
        brandCollectionView.snp.makeConstraints {make in
            make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(76)
        }
    }
    private func register() {
        brandCollectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier:
                                    BrandCollectionViewCell.identifier)
    }
}

extension BrandViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - Inset.left - Inset.right - InterItemSpacing
            return CGSize(width: doubleCellWidth / 6, height: 76)
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

extension BrandViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let Cell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath)
                as? BrandCollectionViewCell else {return UICollectionViewCell() }
        Cell.dataBind(model: brandList[indexPath.item])
        return Cell
    }
}

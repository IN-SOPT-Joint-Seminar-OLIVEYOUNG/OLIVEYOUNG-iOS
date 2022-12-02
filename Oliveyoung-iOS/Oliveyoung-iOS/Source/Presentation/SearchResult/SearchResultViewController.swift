//
//  SearchResultViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/16.
//

import UIKit

import Then
import Moya
import SnapKit

class SearchResultViewController: UIViewController {
    private lazy var containerView = UIScrollView()
    private let titleView = UIView()
    private let indexView1 = UIView()
    private let indexView2 = UIView()
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
    
    final let brandInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
    final let brandInterItemSpacing : CGFloat = 12
    final let brandLineSpacing : CGFloat = 16
    final let brandCellHeight : CGFloat = 76
    final let detailInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:0 , bottom: 0, right: 15)
    
    private lazy var productCollectionView: UICollectionView = {
        
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
        RecommendModel(Image: "drg_big", Brand: "닥터지", Name: "엔젤 아쿠아 수분 진정 크림",Price: "20,800원",Percent: "16%"),RecommendModel(Image: "drg_big", Brand: "닥터지", Name: "엔젤 아쿠아 수분 진정 크림",Price: "20,800원",Percent: "16%")
   ]
    
    
    final let productInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:0 , bottom: 0, right: 15)
    final let productInterItemSpacing : CGFloat = 15
    final let productLineSpacing : CGFloat = 16
    final let productCellHeight : CGFloat = 256

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        
        layout()
        config()
        register()

        
    }
}

extension SearchResultViewController {
    
    private func layout() {
        view.addSubview(containerView)
        [titleView,indexView1,indexView2,brandCollectionView,productCollectionView].forEach{containerView.addSubview($0)
        }
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
            
        titleView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(36)
            
        }
        indexView1.snp.makeConstraints {make in
                make.top.equalTo(self.titleView.snp.bottom)
                make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
                make.height.equalTo(47)
                }
        indexView2.snp.makeConstraints {make in
                make.top.equalTo(self.indexView1.snp.bottom)
                make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
                make.height.equalTo(47)
                }
        brandCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.indexView2.snp.bottom).offset(8)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(145)
                }
        productCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.brandCollectionView.snp.bottom)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(1708)
            make.bottom.equalToSuperview().offset(-1)
                }
            }
    
    private func register() {
        brandCollectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier:
                                    BrandCollectionViewCell.identifier)
        productCollectionView.register(ReccomendCollectionViewCell.self, forCellWithReuseIdentifier:
                                    ReccomendCollectionViewCell.identifier)
    }
    
   
    private func config() {
        titleView.backgroundColor = .red
        indexView1.backgroundColor = .purple
        indexView2.backgroundColor = .blue
        brandCollectionView.backgroundColor = .systemCyan
        productCollectionView.backgroundColor = .systemPink
        
    }
}

extension SearchResultViewController :
    UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case brandCollectionView:
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - brandInset.left - brandInset.right - brandInterItemSpacing
            return CGSize(width: doubleCellWidth / 6, height: 76)
        case productCollectionView:
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - productInset.left - productInset.right - productInterItemSpacing
            return CGSize(width: doubleCellWidth / 3, height: 256)
            
        default:
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - productInset.left - productInset.right - productInterItemSpacing
            return CGSize(width: doubleCellWidth / 3, height: 256)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView{
        case brandCollectionView:
            return brandLineSpacing
        case productCollectionView:
            return productLineSpacing
        default:
            return brandLineSpacing
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView{
        case brandCollectionView:
            return brandInterItemSpacing
        case productCollectionView:
            return productInterItemSpacing
        default:
            return productInterItemSpacing
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView{
        case brandCollectionView:
            return brandInset
        case productCollectionView:
            return productInset
        default:
            return brandInset
        }
    }
}
// MARK: - UICollectionViewDataSource
extension SearchResultViewController: UICollectionViewDataSource {
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch collectionView {
    case brandCollectionView:
        return brandList.count
    case productCollectionView:
        return recommendList.count
    default:
        return brandList.count
    }
}
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch collectionView{
    case brandCollectionView:
        guard let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath)
                as? BrandCollectionViewCell else {return UICollectionViewCell() }
        brandCell.dataBind(model: brandList[indexPath.item])
        return brandCell
        
    case productCollectionView:
        guard let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReccomendCollectionViewCell.identifier, for: indexPath)
                as? ReccomendCollectionViewCell else {return UICollectionViewCell() }
        detailCell.dataBind(model: recommendList[indexPath.item])
        return detailCell
        
        
    default:
        guard let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath)
                as? BrandCollectionViewCell else {return UICollectionViewCell() }
        brandCell.dataBind(model: brandList[indexPath.item])
        return brandCell
     
    }
}
}


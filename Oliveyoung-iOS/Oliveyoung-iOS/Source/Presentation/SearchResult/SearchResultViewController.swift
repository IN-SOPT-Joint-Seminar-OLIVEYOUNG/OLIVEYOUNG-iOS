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
// MARK: - Component
class SearchResultViewController: UIViewController {
private lazy var containerView = UIScrollView()
private let titleView = UIView()
private let indexView1 = UIView()
private let indexView2 = UIView()
private let brandTitle = UILabel().then {
    $0.text = "브랜드"
    $0.font = .tittleSubhead1
    $0.textColor = .black
}
private let producttopview = UIView()
private let productTitle = UILabel().then{
    $0.text = "상품"
    $0.font = .tittleSubhead1
    $0.textColor = .black
}
private let checkButton = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "uncheckedbox"), for: .normal)
}
private let todayTitle = UILabel().then{
    $0.text = "오늘드림"
    $0.font = .bodyBody1
    $0.textColor = .black
}
private let sortButton = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "shape"), for: .normal)
}
private let sortTitle = UILabel().then{
    $0.text = "인기순"
    $0.font = .bodyBody1
    $0.textColor = .black
}
private lazy var brandCollectionView:
    UICollectionView = {
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
// MARK: - Variables
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
    
    
var ProductList: [resultProductModel] = [
        resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),
        resultProductModel(Image: "bremish", Brand: "닥터지", Name: "무드 인핸서 마뜨",Price: "12,321원",Percent: "32%"),
        resultProductModel(Image: "oil", Brand: "닥터지", Name: "치명립스틱",Price: "60,000원",Percent: "16%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%"),resultProductModel(Image: "estra", Brand: "에스트라", Name: "아토베리어 365크림 80ml 더블 기획",Price: "30,900원",Percent: "30%")
       ]
    
//    private var ProductList: [Product] = []
 
    // MARK: - Constants
final let productInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
final let productInterItemSpacing : CGFloat = 1
final let productLineSpacing : CGFloat = 2
final let productCellHeight : CGFloat = 200
override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        config()
        register()
    }
}
// MARK: - Extension
extension SearchResultViewController {
    private func layout() {
        view.addSubview(containerView)
        [titleView,indexView1,indexView2, brandTitle,brandCollectionView,producttopview,productCollectionView].forEach{containerView.addSubview($0)
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
        brandTitle.snp.makeConstraints{make in
            make.bottom.equalTo(self.brandCollectionView.snp.top).offset(-8)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(15)

        }
        producttopview.addSubviews(productTitle,checkButton,todayTitle,sortTitle,sortButton)
        producttopview.snp.makeConstraints{make in
            make.top.equalTo(self.brandCollectionView.snp.bottom)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
brandCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.indexView2.snp.bottom).offset(61)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(76)
                }
producttopview.snp.makeConstraints{make in
            make.top.equalTo(brandCollectionView.snp.bottom)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(49)
        }
productTitle.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(28)
        }
checkButton.snp.makeConstraints{make in
            make.leading.equalTo(productTitle.snp.trailing).offset(16)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(12)
        }
todayTitle.snp.makeConstraints{make in
            make.leading.equalTo(checkButton.snp.trailing).offset(4)
            make.centerY.equalToSuperview()
            make.height.equalTo(28)
            make.width.equalTo(61)
        }
sortTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
        }
sortButton.snp.makeConstraints { make in
            make.trailing.equalTo(sortTitle.snp.leading).offset(-4)
            make.centerY.equalToSuperview()
        }
productCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.producttopview.snp.bottom)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(1708)
            make.bottom.equalToSuperview().offset(-11)
                }
            }

    private func register() {
        brandCollectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier:
                                    BrandCollectionViewCell.identifier)
        productCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier:
                                    ProductCollectionViewCell.identifier)
    }
    private func config() {
        titleView.backgroundColor = .red
        indexView1.backgroundColor = .purple
        indexView2.backgroundColor = .blue
    }
}

// MARK: - CollectionViewConstants
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
        return ProductList.count
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
        guard let productCell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        productCell.dataBind(model: ProductList[indexPath.item])
        return productCell
    default:
        guard let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath)
                as? BrandCollectionViewCell else {return UICollectionViewCell() }
        brandCell.dataBind(model: brandList[indexPath.item])
        return brandCell
        }
    }
}


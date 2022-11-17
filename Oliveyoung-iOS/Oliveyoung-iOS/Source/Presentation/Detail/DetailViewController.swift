//
//  DetailViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/16.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - DetailViewController
final class DetailViewController: UIViewController {
    
    //MARK: - Lazy Components
    private let productCollectionView: UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    //MARK: - Components
    
    private let productContainerView = UIView().then {
        $0.backgroundColor = .red
    }
    
    private let deliveryContainerView = UIView()
    private let availableStoreContainerView = UIView()
    private let productDetailContainerView = UIView()
    private let productRecommandContainerView = UIView()
    private let relatedProductContainerView = UIView()
    
    private let backButton = UIButton()
    private let searchButton = UIButton()
    private let cartButton = UIButton()
    private let brandButton = UIButton()
    private let heartButton = UIButton()
    private let purchaseButton = UIButton()
    
    private let brandLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = 0x2F2F2F.color
        $0.text = "에스트라"
    }
    
    private let productLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = 0x2F2F2F.color
        
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = 0x2F2F2F.color
    }
    
    private let originalPriceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = 0xEBEBEB.color    }
    
    private let discountLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 22, weight: .medium)
        $0.textColor = 0xF87171.color
    }
    
    private let rateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = 0x2F2F2F.color
    }
    
//    private let rateCountLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let productTypeLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let shippingLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let shippingPriceLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let freeShippingLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let overnightShippingLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let overnightPriceLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let overnightTimeLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let minuteLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let hourLable = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let availableStoreLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let storeStatusLabel = UILabel().then {
//        $0.textColor = 0x
//    }
//
//    private let stockLabel = UILabel().then {
//        $0.textColor = 0x
//    }
    
    private let productImageView = UIImage()
    private let searchImageView = UIImage()
    
    
    //MARK: - Variables
    
    //MARK: - Consonants
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
//        buttonConfig()
        layout()
//        configDelegate()
    }
}

//MARK: - Extensions
extension DetailViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        //        view.addSubviews(productContainerView, deliveryContainerView, availableStoreContainerView, productDetailContainerView, productRecommandContainerView, relatedProductContainerView)
        
        view.addSubview(productContainerView)
        productContainerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
    }
    
    //MARK: - General Helpers
//    private func buttonConfig(){
//        backButton.setImage(UIImage(named: <#T##String#>), for: .normal)
//        searchButton.setImage(UIImage(named: "searchIcon24X24"), for: .normal)
//        cartButton.setImage(UIImage(named: "shoppingBag22X22"), for: .normal)
//        brandButton.setImage(UIImage(named: "chevron12X12"), for: .normal)
////        heartButton.setImage(UIImage(named: <#T##String#>), for: .normal)
//        purchaseButton.setTitle("구매하기", for: .normal)
//    }
    
//    private func labelConfig() {
//        brandLabel.
//    }
    
//    private func configDelegate() {
//
//    }
    
    //MARK: - Action Helpers
    
}


////MARK: - UICollectionViewDelegateFlowLayout
//extension DetailViewController: UICollectionViewDelegateFlowLayout {
//
//}
//
////MARK: - UICollectionViewDataSource
//extension DetailViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//}

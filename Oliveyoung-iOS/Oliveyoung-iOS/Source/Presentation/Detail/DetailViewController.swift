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
    
    private let productContainerView = UIView()
    private let deliveryContainerView = UIView()
    private let availableStoreContainerView = UIView()
    private let productDetailContainerView = UIView()
    private let productRecommandContainerView = UIView()
    private let relatedProductContainerView = UIView()
    
    private let backButton = UIButton()
    private let searchButton = UIButton()
    private let cartButton = UIButton()
    private let brandButton = UIButton()
    
    private let brandLabel = UILabel()
    private let productLabel = UILabel()
    private let priceLabel = UILabel()
    private let originalPriceLabel = UILabel()
    private let discountLabel = UILabel()
    private let rateLabel = UILabel()
    private let rateCountLabel = UILabel()
    private let productTypeLabel = UILabel()
    private let shippingLabel = UILabel()
    private let shippingPriceLabel = UILabel()
    private let freeShippingLabel = UILabel()
    private let overnightShippingLabel = UILabel()
    private let overnightPriceLabel = UILabel()
    private let overnightTimeLabel = UILabel()
    
    private let availableStoreLabel = UILabel()
    private let storeStatusLabel = UILabel()
    private let stockLabel = UILabel()
    
    private let productImageView = UIImage()
    
    
    //MARK: - Variables
    
    //MARK: - Consonants
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        configDelegate()
    }
}

//MARK: - Extensions
extension DetailViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        
    }
    
    //MARK: - General Helpers
    private func configDelegate() {
        
    }
    
    //MARK: - Action Helpers
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
}

//MARK: - UICollectionViewDataSource
//extension DetailViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//    
//}

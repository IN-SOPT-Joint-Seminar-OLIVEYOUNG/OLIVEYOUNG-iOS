//
//  DetailViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/16.
//

import UIKit

class DetailViewController: UIViewController {

//MARK: - DetailViewController
final class DetailViewController: UIViewController {
    
    //MARK: - Lazy Components
    private lazy var scrollView = UIScrollView()
    
    private lazy var tagCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    //MARK: - Components
    private let topContainerView = UIView()
    private let productImageContainerView = UIView()
    private let productContainerView = UIView()
    private let deliveryContainerView = UIView()
    private let availableStoreContainerView = UIView()
    private let tabbarButtonContainerView = UIView()
    private let productDetailContainerView = UIView()
    private let productRecommandContainerView = UIView()
    private let relatedProductContainerView = UIView()
    private let bottomContainerView = UIView()
    
    private let backButton = UIButton()
    private let searchButton = UIButton()
    private let cartButton = UIButton()
    private let brandButton = UIButton()
    private let heartButton = UIButton()
    private let purchaseButton = UIButton()
    
        private let brandLabel = UILabel().then {
            $0.font = .bodyBody1
            $0.textColor = 0x2f2f2f.color
        }
    
        private let productLabel = UILabel().then {
            $0.font = .tittleDisplay1
            $0.textColor = 0x2f2f2f.color
    
        }
    
        private let priceLabel = UILabel().then {
            $0.font = .tittleDisplay1
            $0.textColor = 0x2f2f2f.color
        }
    
        private let originalPriceLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0xebebeb.color    }
    
        private let discountLabel = UILabel().then {
            $0.font = .tittleDisplay1
            $0.textColor = 0xf87171.color
        }
    
        private let rateLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0x2f2f2f.color
        }
    
        private let rateCountLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0xebebeb.color
        }
    
        private let productTypeLabel = UILabel().then {
            $0.font = .bodyBody4
            $0.textColor = 0x2f2f2f.color
        }
    
        private let normalShippingLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0x2f2f2f.color
        }
    
        private let shippingPriceLabel = UILabel().then {
            $0.font = .bodyBody1
            $0.textColor = 0x2f2f2f.color
        }
    
        private let freeShippingLabel = UILabel().then {
            $0.font = .bodyBody1
            $0.textColor = 0xa7a7a7.color
        }
    
        private let overnightShippingLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0x2f2f2f.color
        }
    
        private let overnightPriceLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0x2f2f2f.color
        }
    
        private let overnightTimeLabel = UILabel().then {
            $0.font = .bodyBody1
            $0.textColor = 0x2f2f2f.color
        }
    
        private let minuteLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0x2f2f2f.color
        }
    
        private let hourLablel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0x2f2f2f.color
        }
    
        private let availableStoreLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0x2f2f2f.color
        }
    
        private let storeStatusLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0x2f2f2f.color
        }
    
        private let stockLabel = UILabel().then {
            $0.font = .bodyBody5
            $0.textColor = 0x2f2f2f.color
        }
    
    private let productImageView = UIImage()
    private let searchImageView = UIImage()
    
    
    //MARK: - Variables
    var productList:[productModel] = [
        productModel(name: "아이소이", description:"엔젤 아쿠아 수분 진정 크림 150ml모이스춰닥터 장/수/진 수분 앰플 기획" , productImage: "", price: "27,000", discountRate:""),
        productModel(name: "센카", description: "퍼펙트 휩 페이셜 위시 120g", productImage: "", price: "8,500", discountRate: ""),
        productModel(name: "라운드랩", description: "1025 독도 앰플 45g", productImage: "", price: "28,000", discountRate: ""),
        productModel(name: "피지오겔", description: "[한정기획] AI크림 100ml 기획", productImage: "", price: "27,000", discountRate: "23%"),
        productModel(name: "에스트라", description: "아토베리어 365 하이드로 에센스 200ml ", productImage: "", price: "21,600", discountRate: "32%"),
        productModel(name: "아벤느", description: "시칼파트플러스 크림 1+1 기획", productImage: "", price: "19,310", discountRate: "5%")
        
    ]
    
    //MARK: - Consonants
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        buttonConfig()
        tempConfig()
        //        labelConfig()
//        configDelegate()
    }
}

//MARK: - Extensions
extension DetailViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        //components
        
        let containerViews = [
            topContainerView,
            productImageContainerView,
            productContainerView,
            deliveryContainerView,
            availableStoreContainerView,
            tabbarButtonContainerView,
            productDetailContainerView,
            productRecommandContainerView,
            relatedProductContainerView,
            bottomContainerView
        ]
        scrollView.addSubviews(containerViews)
        
        // topContainerView
        [backButton, searchButton, cartButton].forEach {
            topContainerView.addSubview($0)
        }
        // productContainerView
        [brandLabel, productLabel, priceLabel, originalPriceLabel, discountLabel, rateLabel, rateCountLabel, productTypeLabel].forEach {
            productContainerView.addSubview($0)
        }
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        // ContainerViews
        topContainerView.snp.makeConstraints {
            $0.top.equalTo(scrollView)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
        
        productImageContainerView.snp.makeConstraints {
            $0.top.equalTo(topContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(246)
        }
        
        productContainerView.snp.makeConstraints {
            $0.top.equalTo(productImageContainerView.snp.bottom).offset(25)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            $0.height.equalTo(292)
        }
        
        deliveryContainerView.snp.makeConstraints {
            $0.top.equalTo(productContainerView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(98)
        }
        
        availableStoreContainerView.snp.makeConstraints {
            $0.top.equalTo(deliveryContainerView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(83)
        }
        
        tabbarButtonContainerView.snp.makeConstraints {
            $0.top.equalTo(availableStoreContainerView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(65)
        }
        
        productDetailContainerView.snp.makeConstraints {
            $0.top.equalTo(tabbarButtonContainerView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(1685)
        }
        
        productRecommandContainerView.snp.makeConstraints {
            $0.top.equalTo(productDetailContainerView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(269)
        }
        
        relatedProductContainerView.snp.makeConstraints {
            $0.top.equalTo(productRecommandContainerView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(257)
        }
        
        bottomContainerView.snp.makeConstraints {
            $0.top.equalTo(productDetailContainerView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(108)
            $0.bottom.equalToSuperview()
        }
        
        // TopContainerView
        backButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18.5)
            $0.width.height.equalTo(18)
        }
        
        cartButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-18.5)
            $0.width.height.equalTo(22)
        }
        
        searchButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(cartButton.snp.leading).offset(-28)
            $0.width.height.equalTo(22)
        }
        
        // productImageContainerView
        brandLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            
        }
    }
    
    //MARK: - General Helpers
    private func buttonConfig(){
        backButton.setImage(UIImage(named: "arrowIcon18X18"), for: .normal)
        searchButton.setImage(UIImage(named: "searchIcon24X24"), for: .normal)
        cartButton.setImage(UIImage(named: "shoppingBag22X22"), for: .normal)
        brandButton.setImage(UIImage(named: "chevron12X12"), for: .normal)
        //        heartButton.setImage(UIImage(named: ""), for: .normal)
        purchaseButton.setTitle("구매하기", for: .normal)
    }
    
    private func tempConfig() {
        productImageContainerView.backgroundColor = .systemGray4
        productContainerView.backgroundColor = .systemRed
        deliveryContainerView.backgroundColor = .systemOrange
        availableStoreContainerView.backgroundColor = .systemYellow
        tabbarButtonContainerView.backgroundColor = .systemGreen
        productDetailContainerView.backgroundColor = .systemBlue
        productRecommandContainerView.backgroundColor = .systemPurple
        relatedProductContainerView.backgroundColor = .systemCyan
        bottomContainerView.backgroundColor = .systemGray6
    }
    
        private func labelConfig() {
            self.brandLabel.text = "에스트라"
            self.productLabel.text = "에스트라 아토베리어365 크림 80ml 더블 기획"
            self.priceLabel.text = "30,900원"
            self.originalPriceLabel.text = "55,800"
            self.discountLabel.text = "30%"
            self.rateLabel.text = "4.8"
            self.productTypeLabel.text = "제품타입"
            self.normalShippingLabel.text = "일반배송"
            self.shippingPriceLabel.text = "2500원"
            self.freeShippingLabel.text = "(20,000 원 이상 무료배송)"
            self.overnightShippingLabel.text = "오늘드림"
            self.overnightPriceLabel.text = "2,500원 / 5,000원"
            self.overnightTimeLabel.text = "22분 내 주문 시 00시 이내 도착해요"
    //        self.minuteLabel.text = ""
    //        self.hourLablel.text = ""
            self.availableStoreLabel.text = "홍대 공항철도점"
            self.storeStatusLabel.text = "영업중"
            self.stockLabel.text = "보유가능성 높음"
        }
    
    
//    private func configDelegate() {
//        productCollectionView.delegate = self
//        productCollectionView.dataSource = self
        
        
    }
    
    //MARK: - Action Helpers
    
//}

    /*
    // MARK: - Navigation

////MARK: - UICollectionViewDelegateFlowLayout
//extension DetailViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        <#code#>
//    }
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

}

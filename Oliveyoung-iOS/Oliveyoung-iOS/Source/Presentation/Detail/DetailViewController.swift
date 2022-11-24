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
    
    private lazy var recommendCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var relateCollectionView: UICollectionView = {
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
    private let recommendContainerView = UIView()
    private let relatedProductContainerView = UIView()
    private let bottomContainerView = UIView().then {
        $0.borderWidth = 1
        $0.borderColor = 0xebebeb.color
    }
    
    private let productUnderlineView = UIView()
    private let deliveryUnderlineView = UIView()
    private let availableUnderlineView = UIView()
    private let productDetailUnderlineView = UIView()
    private let recommendUnderlineView = UIView()
    private let relatedUnderlineView = UIView()
    private let availableGreenUnderlineView = UIView()
    private let separatelineView = UIView()
    private let purchaseView = UIView()
    
    private let backButton = UIButton()
    private let searchButton = UIButton()
    private let cartButton = UIButton()
    private let brandButton = UIButton()
    private let infoButton = UIButton()
    private let overnightShippingButton = UIButton()
    private let likeButton = UIButton().then {
        $0.isSelected
    }
    
    private let purchaseButton = UIButton()
    
    private let brandLabel = UILabel().then {
        $0.font = .bodyBody1
//        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = 0x2f2f2f.color
    }
    
    private let productLabel = UILabel().then {
        $0.font = .tittleDisplay1
        $0.textColor = 0x2f2f2f.color
        $0.lineBreakMode = .byWordWrapping
        $0.numberOfLines = 0
        
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .tittleDisplay1
        $0.textColor = 0x2f2f2f.color
    }
    
    private let wonLabel = UILabel().then {
        $0.font = .bodyBody5
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
    
    private let firstOvernightLabel = UILabel().then {
        $0.font = .bodyBody1
        $0.textColor = 0x2f2f2f.color
    }
    
    private let secondOvernightLabel = UILabel().then {
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
    
    private let checkAvailableStoreLabel = UILabel().then {
        $0.font = .tittleSubhead1
        $0.textColor = 0xa4d232.color
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
    
    private let recommendLabel = UILabel().then {
        $0.font = .tittleSubhead1
        $0.textColor = 0x2f2f2f.color
    }
    
    private let relateLabel = UILabel().then {
        $0.font = .tittleSubhead1
        $0.textColor = 0x2f2f2f.color
    }
    
    private let purchaseLabel = UILabel().then {
        $0.font = .tittleSubhead1
        $0.textColor = 0x2f2f2f.color
    }
    
    private let rateImageView = UIImageView(image: UIImage(named: "starRate"))
    private let singleStarImageView = UIImageView(image: UIImage(named: "star14X14"))
    private let productImageView = UIImageView(image: UIImage(named: "detailView"))
    private let searchGreenImageView = UIImageView(image: UIImage(named: "searchIcon_green12X12"))

    
    //MARK: - Variables
    var isSelected = true
    
    var tagList = ["립밤", "핸드크림", "틴트", "쿠션", "마스크팩"]
    
    var recommendList:[recommendModel] = [
        recommendModel(name: "아이소이", description:"엔젤 아쿠아 수분 진정 크림 150ml모이스춰닥터 장/수/진 수분 앰플 기획" , productImage: "", price: "27,000"),
        recommendModel(name: "센카", description: "퍼펙트 휩 페이셜 위시 120g", productImage: "", price: "8,500"),
        recommendModel(name: "라운드랩", description: "1025 독도 앰플 45g", productImage: "", price: "28,000")
        ]
    
    var relateList:[relateModel] = [
        relateModel(name: "피지오겔", description: "[한정기획] AI크림 100ml 기획", productImage: "", price: "27,000", discountRate: "23%"),
        relateModel(name: "에스트라", description: "아토베리어 365 하이드로 에센스 200ml ", productImage: "", price: "21,600", discountRate: "32%"),
        relateModel(name: "아벤느", description: "시칼파트플러스 크림 1+1 기획", productImage: "", price: "19,310", discountRate: "5%")
        
    ]
    
    //MARK: - Consonants
    final let tagInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    final let tagLineSpacing: CGFloat = 0
    final let tagInterItemSpacing: CGFloat = 8
    final let tagCellHeight: CGFloat = 27
    
    final let recommendInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    final let recommendLineSpacing: CGFloat = 0
    final let recommendInterItemSpacing: CGFloat = 15
    final let recommendCellHeight: CGFloat = 148
    
    final let relateInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    final let relateLineSpacing: CGFloat = 0
    final let relateInterItemSpacing: CGFloat = 15
    final let relateCellHeight: CGFloat = 148
    
    //MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        register()
        configDelegate()
        labelConfig()
        buttonConfig()
        viewConfig()
        isLikeTapped()
        tempConfig()
    }
}

//MARK: - Extensions
extension DetailViewController {
    
    //MARK: - Layout Helpers
    private func layout() {
        view.backgroundColor = .white
        view.addSubviews(topContainerView,scrollView)
        
        //components
        scrollView.addSubviews(
            productImageContainerView,
            productContainerView,
            productUnderlineView,
            deliveryContainerView,
            deliveryUnderlineView,
            availableStoreContainerView,
            availableUnderlineView,
            tabbarButtonContainerView,
            productDetailContainerView,
            productDetailUnderlineView,
            recommendContainerView,
            recommendUnderlineView,
            relatedProductContainerView,
            relatedUnderlineView,
            bottomContainerView
        )
        
        // topContainerView
        topContainerView.addSubviews(backButton, searchButton, cartButton)
        
        // productContainerView
        productContainerView.addSubviews(
            brandLabel,
            brandButton,
            productLabel,
            priceLabel,
            wonLabel,
            originalPriceLabel,
            discountLabel,
            rateImageView,
            rateLabel,
            rateCountLabel,
            productTypeLabel,
            tagCollectionView
        )
        
        //deliveryContainerView
        deliveryContainerView.addSubviews(
            normalShippingLabel,
            shippingPriceLabel,
            freeShippingLabel,
            overnightShippingLabel,
            infoButton,
            overnightPriceLabel,
            overnightShippingButton,
            minuteLabel,
            firstOvernightLabel,
            hourLablel,
            secondOvernightLabel
        )
        
        //availableStoreContainerView
        availableStoreContainerView.addSubviews(
            checkAvailableStoreLabel,
            searchGreenImageView,
            availableGreenUnderlineView,
            singleStarImageView,
            availableStoreLabel,
            storeStatusLabel,
            separatelineView,
            stockLabel
        )
        
        productDetailContainerView.addSubview(productImageView)
        
        recommendContainerView.addSubviews(
            recommendLabel,
            recommendCollectionView
        )
        
        relatedProductContainerView.addSubviews(
            relateLabel,
            relateCollectionView
        )
        
        bottomContainerView.addSubviews(likeButton, purchaseView, purchaseButton)
        
        purchaseView.addSubview(purchaseLabel)
        
        // ContainerViews
        topContainerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(60)
        }
        
        scrollView.snp.makeConstraints {
            $0.top.equalTo(topContainerView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
        
        productImageContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(246)
        }
        
        productContainerView.snp.makeConstraints {
            $0.top.equalTo(productImageContainerView.snp.bottom).offset(25)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            $0.height.equalTo(292)
        }
        
        productUnderlineView.snp.makeConstraints {
            $0.top.equalTo(productContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
            
        }
        
        deliveryContainerView.snp.makeConstraints {
            $0.top.equalTo(productUnderlineView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(98)
        }
        
        deliveryUnderlineView.snp.makeConstraints {
            $0.top.equalTo(deliveryContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(1)
            
        }
        
        availableStoreContainerView.snp.makeConstraints {
            $0.top.equalTo(deliveryUnderlineView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(83)
        }
        
        availableUnderlineView.snp.makeConstraints {
            $0.top.equalTo(availableStoreContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(7.5)
        }
        
        tabbarButtonContainerView.snp.makeConstraints {
            $0.top.equalTo(availableUnderlineView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(66)
        }
        
        productDetailContainerView.snp.makeConstraints {
            $0.top.equalTo(tabbarButtonContainerView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(1685)
        }
        
        productDetailUnderlineView.snp.makeConstraints {
            $0.top.equalTo(productDetailContainerView.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(7.5)
        }
        
        recommendContainerView.snp.makeConstraints {
            $0.top.equalTo(productDetailUnderlineView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(269)
        }
        
        recommendUnderlineView.snp.makeConstraints {
            $0.top.equalTo(recommendContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(7.5)
        }
        
        relatedProductContainerView.snp.makeConstraints {
            $0.top.equalTo(recommendUnderlineView.snp.bottom)
            $0.leading.trailing.equalTo(productContainerView)
            $0.height.equalTo(257)
        }
        
        bottomContainerView.snp.makeConstraints {
            $0.top.equalTo(relatedProductContainerView.snp.bottom).offset(31.7)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(1)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-1)
            $0.height.equalTo(108)
            $0.bottom.equalToSuperview()
        }
        
        //         TopContainerView
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
        
        //ProductContainerView
        brandLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
        brandButton.snp.makeConstraints {
            $0.top.equalTo(brandLabel)
            $0.leading.equalTo(brandLabel.snp.trailing).offset(3)
            $0.width.height.equalTo(12)
        }
        
        productLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(28)
            $0.leading.equalToSuperview()
        }
        
        wonLabel.snp.makeConstraints {
            $0.bottom.equalTo(priceLabel).offset(-1.5)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(4)
        }
        
        originalPriceLabel.snp.makeConstraints {
            $0.bottom.equalTo(priceLabel)
            $0.leading.equalTo(wonLabel.snp.trailing).offset(15)
        }
        
        discountLabel.snp.makeConstraints {
            $0.bottom.equalTo(priceLabel)
            $0.trailing.equalToSuperview()
        }
        
        rateImageView.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(28)
            $0.leading.equalToSuperview()
            $0.width.equalTo(84)
            $0.height.equalTo(15)
        }
        
        rateLabel.snp.makeConstraints {
            $0.bottom.equalTo(rateImageView)
            $0.leading.equalTo(rateImageView.snp.trailing).offset(8)
        }
        
        rateCountLabel.snp.makeConstraints {
            $0.top.equalTo(rateImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        productTypeLabel.snp.makeConstraints {
            $0.top.equalTo(rateCountLabel.snp.bottom).offset(28)
            $0.leading.equalToSuperview()
        }
        
        tagCollectionView.snp.makeConstraints {
            $0.top.equalTo(productTypeLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(27)
        }
        
        //deliveryContainerView
        
        normalShippingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
        }
        
        shippingPriceLabel.snp.makeConstraints {
            $0.centerY.equalTo(normalShippingLabel)
            $0.leading.equalTo(normalShippingLabel.snp.trailing).offset(46)
        }
        
        freeShippingLabel.snp.makeConstraints {
            $0.centerY.equalTo(normalShippingLabel)
            $0.leading.equalTo(shippingPriceLabel.snp.trailing).offset(4)
        }
        
        overnightShippingLabel.snp.makeConstraints {
            $0.top.equalTo(normalShippingLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
        }
        
        infoButton.snp.makeConstraints {
            $0.centerY.equalTo(overnightShippingLabel)
            $0.leading.equalTo(overnightShippingLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(10)
        }
        
        overnightPriceLabel.snp.makeConstraints {
            $0.centerY.equalTo(overnightShippingLabel)
            $0.leading.equalTo(infoButton.snp.trailing).offset(32)
        }
        
        overnightShippingButton.snp.makeConstraints {
            $0.centerY.equalTo(overnightShippingLabel)
            $0.leading.equalTo(overnightPriceLabel.snp.trailing).offset(9)
            $0.width.height.equalTo(10)
        }
        
        minuteLabel.snp.makeConstraints {
            $0.top.equalTo(overnightPriceLabel.snp.bottom).offset(8)
            $0.leading.equalTo(overnightPriceLabel)
        }
        
        firstOvernightLabel.snp.makeConstraints {
            $0.centerY.equalTo(minuteLabel)
            $0.leading.equalTo(minuteLabel.snp.trailing)
        }
        
        hourLablel.snp.makeConstraints {
            $0.centerY.equalTo(minuteLabel)
            $0.leading.equalTo(firstOvernightLabel.snp.trailing)
        }
        
        secondOvernightLabel.snp.makeConstraints {
            $0.centerY.equalTo(minuteLabel)
            $0.leading.equalTo(hourLablel.snp.trailing)
        }
        
        //availableStoreContainerView
        checkAvailableStoreLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
        }
        
        searchGreenImageView.snp.makeConstraints {
            $0.centerY.equalTo(checkAvailableStoreLabel)
            $0.leading.equalTo(checkAvailableStoreLabel.snp.trailing).offset(4)
            $0.width.height.equalTo(12)
        }
        
        availableGreenUnderlineView.snp.makeConstraints {
            $0.top.equalTo(checkAvailableStoreLabel.snp.bottom).offset(3)
            $0.leading.equalTo(checkAvailableStoreLabel)
            $0.trailing.equalTo(searchGreenImageView)
            $0.height.equalTo(1)
        }
        
        singleStarImageView.snp.makeConstraints {
            $0.top.equalTo(checkAvailableStoreLabel.snp.bottom).offset(17.5)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(11)
        }
        
        availableStoreLabel.snp.makeConstraints {
            $0.centerY.equalTo(singleStarImageView)
            $0.leading.equalTo(singleStarImageView.snp.trailing).offset(4)
        }
        
        storeStatusLabel.snp.makeConstraints {
            $0.centerY.equalTo(singleStarImageView)
            $0.trailing.equalTo(separatelineView.snp.leading).offset(-4)
        }
        
        separatelineView.snp.makeConstraints {
            $0.top.bottom.equalTo(singleStarImageView)
            $0.trailing.equalTo(stockLabel.snp.leading).offset(-4)
            $0.width.equalTo(1.2)
        }
        
        stockLabel.snp.makeConstraints {
            $0.centerY.equalTo(singleStarImageView)
            $0.trailing.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        //recommendContainerView
        recommendLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
        }
        
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(recommendLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(204)
        }
        
        //relateContainerView
        relateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview()
        }
        
        relateCollectionView.snp.makeConstraints {
            $0.top.equalTo(relateLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(192)
        }
        
        //bottomContainerView
        likeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(35)
            $0.leading.equalToSuperview().offset(18.5)
            $0.width.height.equalTo(24)
        }
        
        purchaseView.snp.makeConstraints {
            $0.centerY.equalTo(likeButton)
            $0.leading.equalTo(likeButton.snp.trailing).offset(35)
            $0.trailing.equalToSuperview().offset(-18.5)
            $0.height.equalTo(48)
        }
        
        purchaseLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        purchaseButton.snp.makeConstraints {
            $0.edges.equalTo(purchaseView)
        }
        
    }
    
    //MARK: - General Helpers
    private func buttonConfig(){
        backButton.setImage(UIImage(named: "back"), for: .normal)
        searchButton.setImage(UIImage(named: "searchIcon24X24"), for: .normal)
        cartButton.setImage(UIImage(named: "shoppingBag22X22"), for: .normal)
        brandButton.setImage(UIImage(named: "chevron12X12"), for: .normal)
        infoButton.setImage(UIImage(named: "info"), for: .normal)
        overnightShippingButton.setImage(UIImage(named: "check"), for: .normal)
    }
    
    private func labelConfig() {
        self.brandLabel.text = "에스트라"
        self.productLabel.text = "에스트라 아토베리어365 크림 80ml 더블 기획"
        self.priceLabel.text = "30,900"
        self.wonLabel.text = "원"
        self.originalPriceLabel.text = "55,800"
        self.discountLabel.text = "30%"
        self.rateLabel.text = "4.8"
        self.rateCountLabel.text = "22,159"
        self.productTypeLabel.text = "제품타입"
        self.normalShippingLabel.text = "일반배송"
        self.shippingPriceLabel.text = "2500원"
        self.freeShippingLabel.text = "(20,000 원 이상 무료배송)"
        self.overnightShippingLabel.text = "오늘드림"
        self.overnightPriceLabel.text = "2,500원 / 5,000원"
        self.firstOvernightLabel.text = "내 주문 시"
        self.secondOvernightLabel.text = "이내 도착해요"
        self.minuteLabel.text = "22분"
        self.hourLablel.text = "00시"
        self.checkAvailableStoreLabel.text = "구매가능 매장 확인하기"
        self.availableStoreLabel.text = "홍대공항철도점"
        self.storeStatusLabel.text = "영업중"
        self.stockLabel.text = "재고보유 가능성 높음"
        self.relateLabel.text = "이 상품은 어떠세요?"
        self.recommendLabel.text = "방금 본 것과 유사한 상품이에요"
        self.purchaseLabel.text = "구매하기"
    }
    
    private func viewConfig() {
        productUnderlineView.backgroundColor = 0xebebeb.color
        deliveryUnderlineView.backgroundColor = 0xebebeb.color
        availableUnderlineView.backgroundColor = 0xebebeb.color
        productDetailUnderlineView.backgroundColor = 0xebebeb.color
        recommendUnderlineView.backgroundColor = 0xebebeb.color
        relatedUnderlineView.backgroundColor = 0xebebeb.color
        availableGreenUnderlineView.backgroundColor = 0xa4d232.color
        separatelineView.backgroundColor = 0xebebeb.color
        purchaseView.backgroundColor = 0xa4d232.color
    }
    
    private func configDelegate() {
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
        relateCollectionView.delegate = self
        relateCollectionView.dataSource = self
    }
    
    private func register() {
        tagCollectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.identifier)
        recommendCollectionView.register(recommendCollectionViewCell.self, forCellWithReuseIdentifier: recommendCollectionViewCell.identifier)
        relateCollectionView.register(relateCollectionViewCell.self, forCellWithReuseIdentifier: relateCollectionViewCell.identifier)
    }
    
    private func tempConfig() {
        productImageContainerView.backgroundColor = .systemGray4
        //        productContainerView.backgroundColor = .red
        //        deliveryContainerView.backgroundColor = .systemOrange
        //        availableStoreContainerView.backgroundColor = .systemYellow
        //        tabbarButtonContainerView.backgroundColor = .systemGreen
        //        productDetailContainerView.backgroundColor = .systemBlue
        //        recommendContainerView.backgroundColor = .systemPurple
        //        relatedProductContainerView.backgroundColor = .systemCyan
        //        bottomContainerView.backgroundColor = .systemGray6
    }
    
    //MARK: - Action Helpers
    private func isLikeTapped() {
        if  likeButton.isSelected == true {
            isSelected = false
            likeButton.setImage(UIImage(named: "property1LikeFill24X24"), for: .normal )
        } else {
            isSelected = true
            likeButton.setImage(UIImage(named: "property1Like24X24"), for: .normal)
        }
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == tagCollectionView {
            let tempLabel: UILabel = UILabel()
            tempLabel.text = tagList[indexPath.item]
            return CGSize(width: tempLabel.intrinsicContentSize.width, height: 27)
        } else if collectionView == recommendCollectionView {
            return CGSize(width: 105, height: 204)
        } else {
            return CGSize(width: 105, height: 192)
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == tagCollectionView {
            return tagLineSpacing
        } else if collectionView == recommendCollectionView {
            return recommendLineSpacing
        } else {
            return relateLineSpacing
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == tagCollectionView {
            return tagInterItemSpacing
        } else if collectionView == recommendCollectionView {
            return recommendInterItemSpacing
        } else {
            return relateInterItemSpacing
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == tagCollectionView {
            return tagInset
        } else if collectionView == recommendCollectionView {
            return recommendInset
        } else {
            return relateInset
        }
    }
}

//MARK: - UICollectionViewDataSource
extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == tagCollectionView {
            return tagList.count
        } else if collectionView == recommendCollectionView {
            return 3
        } else {
            return 3
        }
 
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == tagCollectionView {
            guard let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: TagCollectionViewCell.identifier, for: indexPath) as? TagCollectionViewCell else { return UICollectionViewCell() }
            tagCell.dataBind(tag: tagList[indexPath.item])
            return tagCell
        } else if collectionView == recommendCollectionView {
            guard let recommendCell = collectionView.dequeueReusableCell(withReuseIdentifier: recommendCollectionViewCell.identifier, for: indexPath) as?
                    recommendCollectionViewCell else { return UICollectionViewCell() }
            recommendCell.dataBind(model: recommendList[indexPath.item])
            return recommendCell
        } else {
            guard let relateCell = collectionView.dequeueReusableCell(withReuseIdentifier: relateCollectionViewCell.identifier, for: indexPath) as?
                    relateCollectionViewCell else { return UICollectionViewCell() }
            relateCell.dataBind(model: relateList[indexPath.item])
            return relateCell
        }
    }
}

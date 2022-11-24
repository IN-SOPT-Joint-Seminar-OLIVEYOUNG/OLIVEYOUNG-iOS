////
////  EmptyViewController.swift
////  Oliveyoung-iOS
////
////  Created by Joon Baek on 2022/11/24.
////
//
//import UIKit
//
//import Then
//import SnapKit
//import SwiftyColor
//
////MARK: - EmptyViewController
//final class EmptyViewController: UIViewController {
//
//    //MARK: - Lazy Components
//    private lazy var scrollView = UIScrollView()
//    
//    private lazy var relateCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .clear
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.isScrollEnabled = true
//        collectionView.showsVerticalScrollIndicator = false
//        return collectionView
//    }()
//    
//    //MARK: - UI Components
//    
//    private let topContainerView = UIView()
//    private let emptyContainerView = UIView()
//    private let emptyUnderlineView = UIView()
//    private let recommendContainerView = UIView()
//    
//    private let textField = UITextField().then {
//        $0.borderColor = 0xa4d232.color
//        $0.cornerRadius = 19
//    }
//    
//    private let backButton = UIButton().then {
//        $0.setImage(UIImage(named: "back"), for: .normal)
//    }
//    
//    private let searchButton = UIButton().then {
//        $0.setImage(UIImage(named: "searchIcon24X24"), for: .normal)
//    }
//    
//    private let errorImageView = UIImageView().then {
//        $0.image = UIImage(named: "error")
//    }
//    
//    private let errorLabel = UILabel().then {
//        $0.font = .tittleHeadline
//        $0.textColor = 0x2f2f2f.color
//        $0.text = "검색 결과가 없습니다."
//    }
//    
//    private let relateLabel = UILabel().then {
//        $0.font = .tittleSubhead1
//        $0.textColor = 0x2f2f2f.color
//        $0.text = "이 검색어는 어떠세요?"
//    }
//    
//    //MARK: - Variables
//    var recommendList: [searchModel] = [
//        searchModel(name: "립밤"),
//        searchModel(name: "핸드크림"),
//        searchModel(name: "틴트"),
//        searchModel(name: "쿠션"),
//        searchModel(name: "마스크팩"),
//        searchModel(name: "향수"),
//        searchModel(name: "립밤"),
//        searchModel(name: "핸드크림"),
//        searchModel(name: "틴트"),
//        searchModel(name: "쿠션"),
//        searchModel(name: "마스크팩"),
//        searchModel(name: "향수")
//    ]
//    
//    //MARK: - Life Cycles
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        layout()
//    }
//}
//
////MARK: - Extensions
//extension EmptyViewController {
//    
//    //MARK: - Layout Helpers
//    private func layout() {
//        view.addSubviews(topContainerView, scrollView)
//        
//        scrollView.addSubviews(
//            emptyContainerView,
//            emptyUnderlineView,
//            recommendContainerView
//        )
//        
//        topContainerView.addSubviews(
//            backButton,
//            textField,
//            searchButton
//        )
//        
//        textField.addSubview(searchButton)
//        
//        emptyContainerView.addSubviews(
//            errorImageView,
//            errorLabel
//        )
//        
//        recommendContainerView.addSubviews(
//            relateLabel,
//            relateCollectionView
//        )
//        
//        topContainerView.snp.makeConstraints {
//            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
//            $0.height.equalTo(36)
//        }
//        
//        scrollView.snp.makeConstraints {
//            $0.top.equalTo(topContainerView.snp.bottom)
//            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
//        }
//        
//        //containerViews
//        emptyContainerView.snp.makeConstraints {
//            $0.top.equalToSuperview()
//            $0.leading.trailing.equalToSuperview()
//            $0.height.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
//        }
//        
//        emptyUnderlineView.snp.makeConstraints {
//            
//        }
//        
//        recommendContainerView.snp.makeConstraints {
//            
//        }
//        
//        //topContainerView
//        backButton.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.leading.equalToSuperview().offset(28)
//            $0.width.equalTo(18)
//            $0.height.equalTo(16)
//        }
//        
//        textField.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.leading.equalTo(backButton.snp.trailing).offset(14)
//            $0.trailing.equalToSuperview().offset(28)
//            $0.height.equalToSuperview()
//        }
//        
//        searchButton.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.trailing.equalToSuperview().offset(-12)
//            $0.width.height.equalTo(20)
//        }
//        
//        errorImageView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(200.5)
//            $0.centerX.equalToSuperview()
//            $0.width.height.equalTo(84.6)
//        }
//        
//        errorLabel.snp.makeConstraints {
//            $0.top.equalTo(errorImageView.snp.bottom).offset(35.1)
//            $0.centerX.equalToSuperview()
//        }
//        
//        
//    }
//    
//    //MARK: - General Helpers
//    
//}
//
////MARK: - UICollectionViewDelegateFlowLayout
//extension EmptyViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        <#code#>
//    }
//    
//}
//
////MARK: -
//extension EmptyViewController: UICollectionViewDataSource{
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

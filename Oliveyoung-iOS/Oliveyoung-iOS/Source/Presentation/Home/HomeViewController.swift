//
//  HomeViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/16.
//

import UIKit
import SwiftUI

import Then
import SnapKit

final class HomeViewController: UIViewController {
    private lazy var containerView = UIScrollView()
    // MARK: - Components
    private let titleView = UIView()
        private let logoButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "image 4"), for: .normal)
        }
        private let searchButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "searchIcon12X12"), for: .normal)
        }
        private let shoppingbagButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "shopping bag_22x22"), for: .normal)
        }
    private lazy var tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let tabcollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        tabcollectionView.backgroundColor = .clear
        tabcollectionView.translatesAutoresizingMaskIntoConstraints = false
        tabcollectionView.isScrollEnabled = false
        tabcollectionView.showsVerticalScrollIndicator = false
        tabcollectionView.delegate = self
        tabcollectionView.dataSource = self
        return tabcollectionView
    }()
  
    private let adImageView = UIImageView().then {
        $0.image = UIImage(named: "Rectangle 52")
    }
    // MARK: - Reusable Components
    
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
    var tabList: [TabModel] = [
        TabModel(Name: "추천"),TabModel(Name: "특가"),TabModel(Name: "랭킹"),TabModel(Name: "이벤트"),TabModel(Name: "세일") ]
    // MARK: - Constants
    final let menuInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
    final let menuInterItemSpacing : CGFloat = 1
    final let menuLineSpacing : CGFloat = 16
    final let menuCellHeight : CGFloat = 75
    final let tabInset : UIEdgeInsets = UIEdgeInsets(top:24 , left:15 , bottom: 12, right: 15)
    final let tabInterItemSpacing : CGFloat = 10
    final let tabLineSpacing : CGFloat = 3
    final let tabCellHeight : CGFloat = 17
    private let recommendViewTitle = UILabel().then {
        $0.text = "김채령님을 위한 추천 상품!"
        $0.font = .tittleHeadline
        $0.textColor = .black
    }
    private let moreLabel = UILabel().then {
        $0.text = "더보기 >"
        $0.font = .bodyBody1
        $0.textColor = .black
    }
    private let recommendView = UIView()
    private let brandRecommendViewTitle = UILabel().then {
        $0.text = "이 브랜드 어떠세요?"
        $0.font = .tittleHeadline
        $0.textColor = .black
    }
    private let moreLabel2 = UILabel().then {
        $0.text = "더보기 >"
        $0.font = .bodyBody1
        $0.textColor = .black
    }
    private let brandRecommendView = UIView()
    private let brandDetailView = UIView()
    private let onlyViewTitle = UILabel().then {
        $0.text = "오직 올리브영에서만"
        $0.font = .tittleHeadline
        $0.textColor = .black
    }
    private let moreLabel3 = UILabel().then {
        $0.text = "더보기 >"
        $0.font = .bodyBody1
        $0.textColor = .black
    }
    private let adImageView1 = UIImageView().then {
        $0.image = UIImage(named: "purple")
    }
    
    private let adImageView2 = UIImageView().then {
        $0.image = UIImage(named: "yellow")
    }
    private let adImageView3 = UIImageView().then {
        $0.image = UIImage(named: "green")
    }
    private let keyWordTitle = UILabel().then {
        $0.text = "이 달의 키워드 스토리"
        $0.font = .tittleHeadline
        $0.textColor = .black
    }
    private let moreLabel4 = UILabel().then {
        $0.text = "더보기 >"
        $0.font = .bodyBody1
        $0.textColor = .black
    }
    private let adImageView4 = UIImageView().then {
        $0.image = UIImage(named: "banner1")
    }
    private let adImageView5 = UIImageView().then {
        $0.image = UIImage(named: "banner2")
    }
    private let finalImage = UIImageView().then {
        $0.image = UIImage(named: "Frame 275")
    }
    private let finalImage2 = UIImageView().then {
        $0.image = UIImage(named: "Frame 302")
    }
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        config()
        register()
    }
}

//MARK: - extension

extension HomeViewController {
    // MARK: - Layout Helpers
    
    private func layout() {
        view.addSubview(containerView)
        [titleView,tabCollectionView,adImageView,menuCollectionView,recommendViewTitle,moreLabel,recommendView,brandRecommendViewTitle,moreLabel2,brandRecommendView,brandDetailView,onlyViewTitle,moreLabel3,adImageView1,adImageView2,adImageView3,keyWordTitle,moreLabel4,adImageView4,adImageView5,finalImage,finalImage2].forEach {
            containerView.addSubview($0)
        }
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        titleView.addSubviews(logoButton,searchButton,shoppingbagButton)
        titleView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        logoButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.height.width.equalTo(28)
        }
        searchButton.snp.makeConstraints { make in
            make.height.width.equalTo(22)
            make.trailing.equalToSuperview().inset(74)
        }
        shoppingbagButton.snp.makeConstraints { make in
            make.height.width.equalTo(22)
            make.trailing.equalToSuperview().inset(24)
        }
        tabCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.titleView.snp.bottom).offset(24)
                        make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
                        make.height.equalTo(17)
        }
        adImageView.snp.makeConstraints{make in
            make.top.equalTo(self.tabCollectionView.snp.bottom).offset(13)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(216)
        }
        menuCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.adImageView.snp.bottom).offset(13)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(230)
        }
        recommendViewTitle.snp.makeConstraints {make in
            make.top.equalTo(self.menuCollectionView.snp.bottom).offset(48)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(15)
        }
        moreLabel.snp.makeConstraints {make in
            make.top.equalTo(self.menuCollectionView.snp.bottom).offset(48)
            make.trailing.equalTo(self.self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(19)
        }
        recommendView.snp.makeConstraints {make in
            make.top.equalTo(self.recommendViewTitle.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(192)
        }
        brandRecommendViewTitle.snp.makeConstraints {make in
            make.top.equalTo(self.recommendView.snp.bottom).offset(48)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(19)
        }
        moreLabel2.snp.makeConstraints {make in
            make.top.equalTo(self.recommendView.snp.bottom).offset(48)
            make.trailing.equalTo(self.self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(19)
        }
        brandRecommendView.snp.makeConstraints {make in
            make.top.equalTo(self.brandRecommendViewTitle.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(76)
        }
        brandDetailView.snp.makeConstraints {make in
            make.top.equalTo(self.brandRecommendView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(192)
        }
        onlyViewTitle.snp.makeConstraints {make in
            make.top.equalTo(self.brandDetailView.snp.bottom).offset(48)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.height.equalTo(19)
        }
        moreLabel3.snp.makeConstraints {make in
            make.top.equalTo(self.brandDetailView.snp.bottom).offset(48)
            make.trailing.equalTo(self.self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(19)
        }
        adImageView1.snp.makeConstraints{make in
            make.top.equalTo(self.onlyViewTitle.snp.bottom).offset(1)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(78)
        }
        adImageView2.snp.makeConstraints{make in
            make.top.equalTo(self.adImageView1.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(78)
        }
        adImageView3.snp.makeConstraints{make in
            make.top.equalTo(self.adImageView2.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(78)
        }
        keyWordTitle.snp.makeConstraints {make in
            make.top.equalTo(self.adImageView3.snp.bottom).offset(48)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.height.equalTo(19)
        }
        moreLabel4.snp.makeConstraints {make in
            make.top.equalTo(self.adImageView3.snp.bottom).offset(48)
            make.trailing.equalTo(self.self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(19)
        }
        adImageView4.snp.makeConstraints{make in
            make.top.equalTo(self.keyWordTitle.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(78)
        }
        adImageView5.snp.makeConstraints{make in
            make.top.equalTo(self.adImageView4.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(78)
        }
        finalImage.snp.makeConstraints{make in
            make.top.equalTo(self.adImageView5.snp.bottom).offset(9)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(83)
        }
        finalImage2.snp.makeConstraints{make in
            make.top.equalTo(self.finalImage.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(166)
            make.bottom.equalToSuperview().offset(-1)
        }
    }
    private func register() {
        menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        tabCollectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier:
                                    TabCollectionViewCell.identifier)
    }
    // MARK: - General Helpers
    private func config() {
        view.backgroundColor = .white
        adImageView.backgroundColor = .green
        tabCollectionView.backgroundColor = .systemGray4
        recommendView.backgroundColor = .green
        brandRecommendView.backgroundColor = .systemBlue
        brandDetailView.backgroundColor = .purple
    }
}
    // MARK: - UICollectionViewDelegateFlowLayout
  
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case menuCollectionView:
            let screenWidth = UIScreen.main.bounds.width
            let menudoubleCellWidth = screenWidth - menuInset.left - menuInset.right - menuInterItemSpacing
            return CGSize(width: menudoubleCellWidth / 6, height: 75)
        case tabCollectionView:
            let screenWidth = UIScreen.main.bounds.width
            let tabdoubleCellWidth = screenWidth - tabInset.left - tabInset.right - tabInterItemSpacing
            return CGSize(width: tabdoubleCellWidth / 6, height: 17)
        default:
            return CGSize.zero
        }
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            switch collectionView{
            case menuCollectionView:
                return menuLineSpacing
            case tabCollectionView:
                return tabLineSpacing
            default:
                return 0
            }
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            switch collectionView{
            case menuCollectionView:
                return menuInterItemSpacing
            case tabCollectionView:
                return tabInterItemSpacing
            default:
                return 0
            }
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            switch collectionView{
            case menuCollectionView:
                return menuInset
            case tabCollectionView:
                return tabInset
            default:
                return .zero
            }
        }
}
// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case menuCollectionView:
            return menuList.count
        case tabCollectionView:
            return tabList.count
        default:
            return .zero
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case menuCollectionView:
            guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath)
                    as? MenuCollectionViewCell else {return UICollectionViewCell() }
            menuCell.dataBind(model: menuList[indexPath.item])
            return menuCell
        case tabCollectionView:
            guard let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath)
                    as? TabCollectionViewCell else {return UICollectionViewCell() }
            tabCell.dataBind(model: tabList[indexPath.item])
            return tabCell
        default:
            return UICollectionViewCell()
        }
    }
}
struct HomeViewControllerPreView:PreviewProvider {
    static var previews: some View {
        SearchViewController().toPreview()
    }
}

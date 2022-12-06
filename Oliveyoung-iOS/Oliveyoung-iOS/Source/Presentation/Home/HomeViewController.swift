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
  
    private let adImageView = UIImageView().then {
        $0.image = UIImage(named: "Rectangle 52")
    }
    
    // MARK: - Reusable Components
    private lazy var tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    private lazy var recommendCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
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
    private lazy var detailCollectionView: UICollectionView = {
        
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
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
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
    var recommendList: [RecommendModel] = [
        RecommendModel(Image: "beyond", Brand: "비욘드", Name: "엔젤 아쿠아 수분 진정 크림",Price: "20,800원",Percent: "16%"),
        RecommendModel(Image: "hince", Brand: "힌스", Name: "무드 인핸서 마뜨",Price: "12,321원",Percent: "32%"),
        RecommendModel(Image: "3ce", Brand: "3CE", Name: "치명립스틱",Price: "60,000원",Percent: "16%"),

       ]
    var brandList: [BrandModel] = [
        BrandModel(Image: "drg", Brand: "비욘드"),
        BrandModel(Image: "urage", Brand: "유리아주"),
        BrandModel(Image: "nuxe", Brand: "넉스"),
        BrandModel(Image: "innerlab", Brand: "이너랩"),
        BrandModel(Image: "freemay", Brand: "프리메이"),
       ]
    var DetailList: [RecommendModel] = [
        RecommendModel(Image: "drg_big", Brand: "닥터지", Name: "엔젤 아쿠아 수분 진정 크림",Price: "20,800원",Percent: "16%"),
        RecommendModel(Image: "bremish", Brand: "닥터지", Name: "무드 인핸서 마뜨",Price: "12,321원",Percent: "32%"),
        RecommendModel(Image: "oil", Brand: "닥터지", Name: "치명립스틱",Price: "60,000원",Percent: "16%"),
       ]
    
    
    // MARK: - Constants
    final let menuInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
    final let menuInterItemSpacing : CGFloat = 1
    final let menuLineSpacing : CGFloat = 16
    final let menuCellHeight : CGFloat = 75
    final let tabInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
    final let tabInterItemSpacing : CGFloat = 10
    final let tabLineSpacing : CGFloat = 3
    final let tabCellHeight : CGFloat = 17
    final let recInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:0 , bottom: 0, right: 15)
    final let recInterItemSpacing : CGFloat = 15
    final let recLineSpacing : CGFloat = 16
    final let recCellHeight : CGFloat = 192
    final let brandInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
    final let brandInterItemSpacing : CGFloat = 12
    final let brandLineSpacing : CGFloat = 16
    final let brandCellHeight : CGFloat = 76
    final let detailInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:0 , bottom: 0, right: 15)
    final let detailInterItemSpacing : CGFloat = 15
    final let detailLineSpacing : CGFloat = 16
    final let detailCellHeight : CGFloat = 192

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

//    private let brandDetailView = UIView()
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
        configDelegate()
        searchButton.addTarget(self, action: #selector(searchButtonDidTap), for: .touchUpInside)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func searchButtonDidTap() {
        self.navigationController?.pushViewController(SearchViewController(), animated: true)
    }
}

//MARK: - extension

extension HomeViewController {
    // MARK: - Layout Helpers
    
    private func layout() {
        view.addSubview(containerView)
        [titleView,tabCollectionView,adImageView,menuCollectionView,recommendViewTitle,moreLabel,recommendCollectionView,brandRecommendViewTitle,moreLabel2,brandCollectionView,detailCollectionView,onlyViewTitle,moreLabel3,adImageView1,adImageView2,adImageView3,keyWordTitle,moreLabel4,adImageView4,adImageView5,finalImage,finalImage2].forEach {
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
            make.centerY.equalToSuperview()
            make.height.width.equalTo(28)
        }
        searchButton.snp.makeConstraints { make in
            make.height.width.equalTo(22)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(74)
        }
        shoppingbagButton.snp.makeConstraints { make in
            make.height.width.equalTo(22)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(24)
        }
        tabCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.titleView.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(20)
        }
        adImageView.snp.makeConstraints{make in
            make.top.equalTo(self.tabCollectionView.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(216)
        }
        menuCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.adImageView.snp.bottom).offset(13)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(180)
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
        recommendCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.recommendViewTitle.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(192)
        }
        brandRecommendViewTitle.snp.makeConstraints {make in
            make.top.equalTo(self.recommendCollectionView.snp.bottom).offset(48)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(19)
        }
        moreLabel2.snp.makeConstraints {make in
            make.top.equalTo(self.recommendCollectionView.snp.bottom).offset(48)
            make.trailing.equalTo(self.self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(19)
        }
        brandCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.brandRecommendViewTitle.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(76)
        }
        detailCollectionView.snp.makeConstraints {make in
            make.top.equalTo(self.brandCollectionView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(192)
        }
        onlyViewTitle.snp.makeConstraints {make in
            make.top.equalTo(self.detailCollectionView.snp.bottom).offset(48)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(15)
            make.height.equalTo(19)
        }
        moreLabel3.snp.makeConstraints {make in
            make.top.equalTo(self.detailCollectionView.snp.bottom).offset(48)
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
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(15)
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
        recommendCollectionView.register(ReccomendCollectionViewCell.self, forCellWithReuseIdentifier:
                                    ReccomendCollectionViewCell.identifier)
        brandCollectionView.register(BrandCollectionViewCell.self, forCellWithReuseIdentifier:
                                    BrandCollectionViewCell.identifier)
        detailCollectionView.register(ReccomendCollectionViewCell.self, forCellWithReuseIdentifier:
                                    ReccomendCollectionViewCell.identifier)
        
    }
    
    private func configDelegate() {
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
        recommendCollectionView.delegate = self
        recommendCollectionView.dataSource = self
    }
    
    // MARK: - General Helpers
    private func config() {
        view.backgroundColor = .white
//        brandDetailView.backgroundColor = .purple
    }
}
    // MARK: - UICollectionViewDelegateFlowLayout
  
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case menuCollectionView:
            let menudoubleCellWidth = screenWidth - menuInset.left - menuInset.right - menuInterItemSpacing
            return CGSize(width: menudoubleCellWidth / 6, height: (menudoubleCellWidth / 6) * 1.3)
        case tabCollectionView:
            let screenWidth = UIScreen.main.bounds.width
            let tabdoubleCellWidth = screenWidth - tabInset.left - tabInset.right - tabInterItemSpacing
            return CGSize(width: tabdoubleCellWidth / 6, height: 29)
        case recommendCollectionView:
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - recInset.left - recInset.right - recInterItemSpacing
            return CGSize(width: doubleCellWidth / 4, height: 200)
        case brandCollectionView:
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - brandInset.left - brandInset.right - brandInterItemSpacing
            return CGSize(width: doubleCellWidth / 6, height: 76)
        case detailCollectionView:
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - detailInset.left - detailInset.right - detailInterItemSpacing
            return CGSize(width: doubleCellWidth / 4, height: 192)
        default:
            let screenWidth = UIScreen.main.bounds.width
            let tabdoubleCellWidth = screenWidth - tabInset.left - tabInset.right - tabInterItemSpacing
            return CGSize(width: tabdoubleCellWidth / 6, height: 17)
        }
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            switch collectionView{
            case menuCollectionView:
                return 16
            case tabCollectionView:
                return tabLineSpacing
            case recommendCollectionView:
                return recLineSpacing
            case brandCollectionView:
                return brandLineSpacing
            case detailCollectionView:
                return detailLineSpacing
            default:
                return tabLineSpacing
            }
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            switch collectionView{
            case menuCollectionView:
                return 4
            case tabCollectionView:
                return tabInterItemSpacing
            case recommendCollectionView:
                return recInterItemSpacing
            case brandCollectionView:
                return brandInterItemSpacing
            case detailCollectionView:
                return detailInterItemSpacing
            default:
                return tabInterItemSpacing
            }
        }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            switch collectionView{
            case menuCollectionView:
                return UIEdgeInsets(top:0 , left:0 , bottom: 0, right: 0)
            case tabCollectionView:
                return tabInset
            case recommendCollectionView:
                return recInset
            case brandCollectionView:
                return brandInset
            case detailCollectionView:
                return detailInset
            default:
                return tabInset
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
        case recommendCollectionView:
            return recommendList.count
        case brandCollectionView:
            return brandList.count
        case detailCollectionView:
            return DetailList.count
        default:
            return tabList.count
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
        case recommendCollectionView:
            guard let recCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReccomendCollectionViewCell.identifier, for: indexPath)
                    as? ReccomendCollectionViewCell else {return UICollectionViewCell() }
            recCell.dataBind(model: recommendList[indexPath.item])
            return recCell
        case brandCollectionView:
            guard let brandCell = collectionView.dequeueReusableCell(withReuseIdentifier: BrandCollectionViewCell.identifier, for: indexPath)
                    as? BrandCollectionViewCell else {return UICollectionViewCell() }
            brandCell.dataBind(model: brandList[indexPath.item])
            return brandCell
            
        case detailCollectionView:
            guard let detailCell = collectionView.dequeueReusableCell(withReuseIdentifier: ReccomendCollectionViewCell.identifier, for: indexPath)
                    as? ReccomendCollectionViewCell else {return UICollectionViewCell() }
            detailCell.dataBind(model: recommendList[indexPath.item])
            return detailCell
        default:
            guard let tabCell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath)
                    as? TabCollectionViewCell else {return UICollectionViewCell() }
            tabCell.dataBind(model: tabList[indexPath.item])
            return tabCell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case menuCollectionView:
            if indexPath.item == 1 {
                self.navigationController?.pushViewController(CategoryDetailViewController(), animated: true)
            }
            else {
                self.navigationController?.pushViewController(ErrorViewController(), animated: true)
            }
        default:
            self.navigationController?.pushViewController(ErrorViewController(), animated: true)
        }
    }
    
}
struct HomeViewControllerPreView:PreviewProvider {
    static var previews: some View {
        HomeViewController().toPreview()
    }
}

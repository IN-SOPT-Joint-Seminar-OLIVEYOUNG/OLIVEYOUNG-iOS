//
//  HomeViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/16.
//

import UIKit

import Then

class HomeViewController: UIViewController {
    
    private let friendLabel = UILabel().then {
        $0.text = "친구"
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
    }

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
    
    
    private let tabView = UIView()
        private let tabButton1 = UIButton().then {
        $0.setTitle("추천", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        $0.backgroundColor = .clear
        }
        private let tabButton2 = UIButton().then {
        $0.setTitle("특가", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        $0.backgroundColor = .clear
        }
        private let tabButton3 = UIButton().then {
        $0.setTitle("랭킹", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        $0.backgroundColor = .clear
        }
        private let tabButton4 = UIButton().then {
        $0.setTitle("이벤트", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        $0.backgroundColor = .clear
        }
        private let tabButton5 = UIButton().then {
        $0.setTitle("세일", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        $0.backgroundColor = .clear
        }
    
    
  
    
    
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
    
    final let menuInset : UIEdgeInsets = UIEdgeInsets(top:0 , left:15 , bottom: 0, right: 15)
    final let menuInterItemSpacing : CGFloat = 1
    final let menuLineSpacing : CGFloat = 16
    final let menuCellHeight : CGFloat = 75
    
    private let recommendViewTitle = UILabel().then {
        $0.text = "김채령님을 위한 추천 상품!"
        $0.font = .systemFont(ofSize: 18,weight:.bold)
        $0.textColor = .black
    }
    
    private let moreLabel = UILabel().then {
        $0.text = "더보기 >"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .black
    }
    
    
    private let recommendView = UIView()
    
    private let brandRecommendViewTitle = UILabel().then {
        $0.text = "이 브랜드 어떠세요?"
        $0.font = .systemFont(ofSize: 18,weight:.bold)
        $0.textColor = .black
    }
    
    private let moreLabel2 = UILabel().then {
        $0.text = "더보기 >"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .black
    }
    
    private let brandRecommendView = UIView()
    
    private let brandDetailView = UIView()
    
    private let onlyViewTitle = UILabel().then {
        $0.text = "오직 올리브영에서만"
        $0.font = .systemFont(ofSize: 18,weight:.bold)
        $0.textColor = .black
    }
    
    private let moreLabel3 = UILabel().then {
        $0.text = "더보기 >"
        $0.font = .systemFont(ofSize: 18)
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
        $0.font = .systemFont(ofSize: 18,weight:.bold)
        $0.textColor = .black
    }
    
    private let moreLabel4 = UILabel().then {
        $0.text = "더보기 >"
        $0.font = .systemFont(ofSize: 18)
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
   
    

   
    
    // MARK: - Variables

    



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
        
        
        [titleView,tabView,adImageView,menuCollectionView,recommendViewTitle,moreLabel,recommendView,brandRecommendViewTitle,moreLabel2,brandRecommendView,brandDetailView,onlyViewTitle,moreLabel3,adImageView1,adImageView2,adImageView3,keyWordTitle,moreLabel4,adImageView4,adImageView5,finalImage,finalImage2].forEach {
            containerView.addSubview($0)
        }
 
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        
        titleView.addSubviews([logoButton,searchButton,shoppingbagButton])
        
        tabView.addSubviews([tabButton1,tabButton2,tabButton3,tabButton4,tabButton5])

        
        
        
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
        
        tabView.snp.makeConstraints{make in
            make.top.equalTo(self.titleView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(17)
        }
        tabButton1.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
        }
        tabButton2.snp.makeConstraints { make in
            make.leading.equalTo(self.tabButton1.snp.leading).inset(49)
        }
        tabButton3.snp.makeConstraints { make in
            make.leading.equalTo(self.tabButton2.snp.leading).inset(49)
        }
        tabButton4.snp.makeConstraints { make in
            make.leading.equalTo(self.tabButton3.snp.leading).inset(49)
        }
        tabButton5.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(21)
        }
        
        
        adImageView.snp.makeConstraints{make in
            make.top.equalTo(self.tabView.snp.bottom).offset(13)
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
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)

        }
        
        moreLabel.snp.makeConstraints {make in
            make.top.equalTo(self.menuCollectionView.snp.bottom).offset(48)
            make.trailing.equalTo(self.self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(19)
        }
        
        
        recommendView.snp.makeConstraints {make in
            make.top.equalTo(self.recommendViewTitle.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(192)
        }
        
        brandRecommendViewTitle.snp.makeConstraints {make in
            make.top.equalTo(self.recommendView.snp.bottom).offset(48)
            make.height.equalTo(19)
        }
        
        moreLabel2.snp.makeConstraints {make in
            make.top.equalTo(self.recommendView.snp.bottom).offset(48)
            make.trailing.equalTo(self.self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(19)
        }
        
        
        
        brandRecommendView.snp.makeConstraints {make in
            make.top.equalTo(self.brandRecommendViewTitle.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(76)

        }
        
        brandDetailView.snp.makeConstraints {make in
            make.top.equalTo(self.brandRecommendView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(192)

        }
        
        onlyViewTitle.snp.makeConstraints {make in
            make.top.equalTo(self.brandDetailView.snp.bottom).offset(48)
            make.height.equalTo(19)
        }
        
        moreLabel3.snp.makeConstraints {make in
            make.top.equalTo(self.brandDetailView.snp.bottom).offset(48)
            make.trailing.equalTo(self.self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(19)
        }
        
        adImageView1.snp.makeConstraints{make in
            make.top.equalTo(self.onlyViewTitle.snp.bottom).offset(1)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(78)
        }
        
        adImageView2.snp.makeConstraints{make in
            make.top.equalTo(self.adImageView1.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(78)
        }
        
        adImageView3.snp.makeConstraints{make in
            make.top.equalTo(self.adImageView2.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(78)
        }
        
        keyWordTitle.snp.makeConstraints {make in
            make.top.equalTo(self.adImageView3.snp.bottom).offset(48)
            make.height.equalTo(19)
        }
        
        moreLabel4.snp.makeConstraints {make in
            make.top.equalTo(self.adImageView3.snp.bottom).offset(48)
            make.trailing.equalTo(self.self.view.safeAreaLayoutGuide).offset(-15)
            make.height.equalTo(19)

        }
        
        adImageView4.snp.makeConstraints{make in
            make.top.equalTo(self.keyWordTitle.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            make.height.equalTo(78)
        }
        
        adImageView5.snp.makeConstraints{make in
            make.top.equalTo(self.adImageView4.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
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
    }
    
    
    
    
    
    
    // MARK: - General Helpers
    private func config() {
        view.backgroundColor = .white
        adImageView.backgroundColor = .green
      
        recommendView.backgroundColor = .green
        brandRecommendView.backgroundColor = .systemBlue
        brandDetailView.backgroundColor = .purple
    }
    
}
    
    // MARK: - UICollectionViewDelegateFlowLayout
  
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let screenWidth = UIScreen.main.bounds.width
            let doubleCellWidth = screenWidth - menuInset.left - menuInset.right - menuInterItemSpacing
            return CGSize(width: doubleCellWidth / 6, height: 75)
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return menuLineSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return menuInterItemSpacing
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return menuInset
        }
    
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath)
                as? MenuCollectionViewCell else {return UICollectionViewCell() }
        menuCell.dataBind(model: menuList[indexPath.item])
        return menuCell
    }
}

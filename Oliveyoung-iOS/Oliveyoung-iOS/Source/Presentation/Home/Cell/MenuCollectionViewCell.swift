//
//  MenuCollectionViewCell.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/20.
//

import UIKit
import SnapKit

class MenuCollectionViewCell: UICollectionViewCell {
    static let identifier = "MenuCollectionViewCell"
    
    private let menuContainerView = UIView()
    private let menuImageView = UIImageView()
    private let menuLabel = UILabel().then{
        $0.font = .bodyBody1
    }
    
//MARK: - Life Cycle
    override init(frame : CGRect){
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension MenuCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
//        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [menuImageView,menuLabel].forEach {
            menuContainerView.addSubview($0)
        }
        contentView.addSubview(menuContainerView)
        menuContainerView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(0)
//            $0.centerX.centerY.equalToSuperview()
//            $0.leading.equalToSuperview().offset(0)
//            $0.height.equalTo(75)
            $0.edges.equalToSuperview()
        }
        
        menuImageView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(menuImageView.snp.height).multipliedBy(1)
//            $0.height.width.equalTo(57)
        }
        
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(menuImageView.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
//            $0.leading.trailing.equalTo(menuContainerView).offset(0)
//            $0.trailing.equalToSuperview().offset(-9)
        }
        
        
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: MenuModel) {
        menuLabel.text = model.name
        menuImageView.image = UIImage(named: model.menuImage)
    }
}

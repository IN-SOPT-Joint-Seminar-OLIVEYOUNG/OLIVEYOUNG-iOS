//
//  MenuCollectionViewCell.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/20.
//

import UIKit
import SnapKit
import Then

class TabCollectionViewCell: UICollectionViewCell {
    static let identifier = "TabCollectionViewCell"
    
//    private let ContainerView = UIView()
    
    private let tabLabel = UILabel().then{
        $0.font = .tittleSubhead1
        $0.textColor = .black
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

extension TabCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        contentView.backgroundColor = .clear
        contentView.addSubview(tabLabel)
//        ContainerView.snp.makeConstraints {
//            $0.top.equalToSuperview().offset(8)
//            $0.centerX.equalToSuperview()
////            $0.leading.equalToSuperview().offset(9)
////            $0.height.equalTo(192)
//        }
        
        tabLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
//            $0.top.equalToSuperview()
            $0.height.equalTo(29)
        }

        
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: TabModel) {
        tabLabel.text = model.Name
    }
}

//
//  MenuCollectionViewCell.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/20.
//

import UIKit
import SnapKit

class TabCollectionViewCell: UICollectionViewCell {
    static let identifier = "TabCollectionViewCell"
    
    private let ContainerView = UIView()
    
    private let tabLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 15, weight: .bold)
        $0.textColor = .systemGray2
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
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [ContainerView,tabLabel].forEach {
            contentView.addSubview($0)
        }
        ContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
//            $0.leading.equalToSuperview().offset(9)
//            $0.height.equalTo(192)
        }
        
        tabLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(17)
        }

        
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: TabModel) {
        tabLabel.text = model.Name
    }
}

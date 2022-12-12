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
    private let tabLabel = UILabel().then{
        $0.font = .tittleSubhead1
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
        contentView.backgroundColor = .clear
        contentView.addSubview(tabLabel)
        tabLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(29)
        }
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: TabModel) {
        tabLabel.text = model.Name
    }
}

//
//  MenuCollectionViewCell.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/20.
//

import UIKit

class BrandCollectionViewCell: UICollectionViewCell {
    static let identifier = "BrandCollectionViewCell"
    
    private let brandContainerView = UIView()
    private let brandImageView = UIImageView()
    private let brandLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 12, weight: .bold)
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

extension BrandCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [brandContainerView,brandLabel].forEach {
            contentView.addSubview($0)
        }
        
        brandContainerView.addSubview(brandImageView)
        brandContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(0)
//            $0.height.equalTo(57)
        }
        
        brandImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(brandImageView.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
//            $0.leading.trailing.equalTo(menuContainerView).offset(0)
//            $0.trailing.equalToSuperview().offset(-9)
        }
        
        
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: BrandModel) {
        brandLabel.text = model.Brand
        brandImageView.image = UIImage(named: model.Image)
    }
}

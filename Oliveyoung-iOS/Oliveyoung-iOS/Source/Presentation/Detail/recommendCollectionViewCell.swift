//
//  ProductCollectionViewCell.swift
//  Oliveyoung-iOS
//
//  Created by Joon Baek on 2022/11/17.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - recommendCollectionViewCell
final class recommendCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI Components
    
    private let productImageView = UIImageView().then {
        $0.cornerRadius = 10
        $0.backgroundColor = .systemGray6
    }
    
    private let productLabel = UILabel().then {
        $0.font = .bodyBody2
        $0.textColor = 0x2f2f2f.color
        $0.numberOfLines = 0
    }
    
    private let descriptionLabel = UILabel().then {
        $0.font = .bodyCaption
        $0.textColor = 0x2f2f2f.color
        $0.numberOfLines = 0
    }
    private let priceLabel = UILabel().then {
        $0.font = .bodyBody2
        $0.textColor = 0x2f2f2f.color
        $0.numberOfLines = 0
    }
    private let wonLabel = UILabel().then {
        $0.font = .bodyCaption2
        $0.textColor = 0x2f2f2f.color
        $0.text = "원"
    }
    
    private let discountLabel = UILabel().then {
        $0.font = .bodyBody2
        $0.textColor = 0xf87171.color
    }
    
    //MARK: - Identifier
    static let identifier = "recommendCollectionViewCell"
    
    //MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extensions
extension recommendCollectionViewCell {
    
    //MARK: - Layout Helpers
    private func layout() {
        contentView.addSubviews(
            productImageView,
            productLabel,
            descriptionLabel,
            priceLabel,
            wonLabel
        )
        
        productImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        productLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-5)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
        }
        
        wonLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel)
            $0.leading.equalTo(priceLabel.snp.trailing)
        }
    }
    
    //MARK: - General Helpers
    
    func dataBind(model: recommendModel) {
        productImageView.image = UIImage(named: model.productImage)
        productLabel.text = model.name
        descriptionLabel.text = model.description
        priceLabel.text = model.price
        discountLabel.text = model.price
    }
    
}


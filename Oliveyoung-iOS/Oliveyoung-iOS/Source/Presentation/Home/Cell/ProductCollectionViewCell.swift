//
//  MenuCollectionViewCell.swift
//  Oliveyoung-iOS
//
//  Created by YEONOO on 2022/11/20.
//

import UIKit
import SnapKit

import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProductCollectionViewCell"
    
    private let ContainerView = UIView()
    private let ImageView = UIImageView()
    private let brandLabel = UILabel().then{
        $0.font = .bodyBody2
    }
    private let nameLabel = UILabel().then{
        $0.font = .bodyCaption
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }
    private let price = UILabel().then{
        $0.font = .bodyBody2
    }
    private let percent = UILabel().then{
        $0.font = .bodyBody2
        $0.textColor = .red
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

extension ProductCollectionViewCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        [ContainerView,ImageView,brandLabel,nameLabel,price,percent].forEach {
            contentView.addSubview($0)
        }
        
//        ContainerView.addSubview(ImageView)
        ContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(9)
            $0.height.equalTo(256)
        }
        
        ImageView.snp.makeConstraints {
            $0.top.left.right.equalToSuperview()
            $0.height.equalTo(184)
//            $0.width.equalTo(105)
        }
        
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(ImageView.snp.bottom).offset(8)
            $0.leading.equalTo(self.ContainerView.snp.leading)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.ContainerView.snp.leading)
        }
        price.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.ContainerView.snp.leading)
        }
        percent.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(8)
            $0.trailing.equalTo(self.ContainerView.snp.trailing)
        }
        
        
    }
    
//    // MARK: - General Helpers
//    func configureUI(product: Product) {
//        brandLabel.text = product.brandName
//        nameLabel.text = product.name
//        price.text = product.saledPrice
//        percent.text = product.salePercent
//        guard let url = URL(string: product.mainImg) else { return }
//        ImageView.kf.setImage(with: url)
//    }
//brandName: self.brandName, mainImg: self.mainImg, name: self.name, saledPrice: self.saledPrice, salePercent: self.salePercent
    func dataBind(model: resultProductModel) {
        brandLabel.text = model.Brand
        nameLabel.text = model.Name
        ImageView.image = UIImage(named: model.Image)
        price.text = model.Price
        percent.text = model.Percent
    }
}

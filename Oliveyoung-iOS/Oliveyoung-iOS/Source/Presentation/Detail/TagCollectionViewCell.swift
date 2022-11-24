//
//  TagCollectionViewCell.swift
//  Oliveyoung-iOS
//
//  Created by Joon Baek on 2022/11/17.
//

import UIKit

import Then
import SnapKit
import SwiftyColor

//MARK: - TagCollectionViewCell
final class TagCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI Components
    private let tagView = UIView().then {
        $0.backgroundColor = 0xa4d232.color
        $0.cornerRadius = 15
    }
    
    private let tagLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = 0xffffff.color
    }
    
    //MARK: - Identifier
    static let identifier = "TagCollectionViewCell"
    
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
extension TagCollectionViewCell {
    
    //MARK: - Layout Helpers
    private func layout() {
        contentView.addSubviews(tagView, tagLabel)
        
        tagView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        tagLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
    }
    
    //MARK: - General Helpers
    func dataBind(tag: String) {
        tagLabel.text = tag
    }
    
}

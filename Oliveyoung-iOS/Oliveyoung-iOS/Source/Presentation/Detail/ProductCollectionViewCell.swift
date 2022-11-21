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

//MARK: - ProductCollectionViewCell
final class ProductCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UI Components
    
    //MARK: - Identifier
    static let identifier = "ProductCollectionViewCell"
    
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
extension ProductCollectionViewCell {
    
    //MARK: - Layout Helpers
    private func layout() {
        
    }
    
    //MARK: - General Helpers
    
}


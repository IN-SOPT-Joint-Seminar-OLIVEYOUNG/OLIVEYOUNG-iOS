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
        
    }
    
    //MARK: - General Helpers
    
}

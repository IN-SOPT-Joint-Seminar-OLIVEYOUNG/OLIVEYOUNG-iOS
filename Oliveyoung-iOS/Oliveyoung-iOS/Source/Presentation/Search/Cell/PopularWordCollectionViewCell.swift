//
//  PopularWordCollectionViewCell.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/24.
//

import UIKit

class PopularWordCollectionViewCell: UICollectionViewCell {
    // MARK: - Component
    private let searchWordLabel = UILabel().then {
        $0.font = .bodyBody5
        $0.textColor = .willaGrayGray500
        $0.textAlignment = .center
    }
    
    // MARK: - Life Cycles
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.width = ceil(size.width)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
    
    // MARK: - Function
    private func setUI() {
        contentView.addSubview(searchWordLabel)
        contentView.makeColorRounded(12, 1, .willa)
    }
    
    private func setLayout() {
        contentView.addSubview(searchWordLabel)
        
        searchWordLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(24)
        }
    }
    
    func configureUI(word: Word) {
        searchWordLabel.text = word.word
    }
}

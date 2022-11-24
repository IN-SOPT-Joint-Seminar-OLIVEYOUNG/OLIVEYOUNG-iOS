//
//  SearchSectionView.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/24.
//

import UIKit

import SnapKit
import Then

final class SearchSectionView: UICollectionReusableView {
    static let identifier = "SearchSectionView"

    private let titleLabel = UILabel().then {
        $0.textColor = .willaGrayGray500
        $0.textAlignment = .left
        $0.font = .tittleSubhead1
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }

    required init(coder: NSCoder) {
        fatalError("SearchSectionView: fatal error")
    }
    
    private func setupView() {
        addSubview(titleLabel)
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.height.equalTo(17)
        }
    }

    func setTitle(text: String) {
        self.titleLabel.text = text
    }
}

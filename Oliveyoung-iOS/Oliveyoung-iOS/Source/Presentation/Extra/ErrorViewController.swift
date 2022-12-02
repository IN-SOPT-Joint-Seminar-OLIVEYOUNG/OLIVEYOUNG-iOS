//
//  ErrorViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/12/02.
//

import UIKit
import SwiftUI

import SnapKit
import Then

final class ErrorViewController: UIViewController {
    
    static let identifier = "ErrorViewController"
    
    private let errorImage = UIImageView().then {
        $0.image = Const.Image.error
    }
    private let errorMessage = UILabel().then {
        $0.textColor = .willaGrayGray500
        $0.font = .tittleSubhead2
        $0.numberOfLines = 2
        $0.text = "잘못된 접근입니다.\n다시 시도해주세요."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setView()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func setView() {
        view.addSubviews(errorImage, errorMessage)
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        errorImage.snp.makeConstraints {
            $0.width.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
        }
        errorMessage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(errorImage.snp.bottom).offset(15)
        }
    }
}

struct ErrorViewControllerPreView: PreviewProvider {
    static var previews: some View {
        ErrorViewController().toPreview()
    }
}

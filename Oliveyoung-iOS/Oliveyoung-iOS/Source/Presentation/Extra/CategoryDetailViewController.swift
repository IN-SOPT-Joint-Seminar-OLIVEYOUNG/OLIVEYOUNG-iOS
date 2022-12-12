//
//  CategoryDetailViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/12/02.
//

import UIKit
import SwiftUI

import SnapKit
import Then

class CategoryDetailViewController: UIViewController {
    
    private let viewImage = UIImageView().then {
        $0.image = Const.Image.categoryImage
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setView()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setView() {
        view.addSubview(viewImage)
    }
    
    private func setLayout() {
        viewImage.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

struct CategoryDetailViewControllerPreView: PreviewProvider {
    static var previews: some View {
        CategoryDetailViewController().toPreview()
    }
}

//
//  ImageSearchResultViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/12/02.
//

import UIKit

import SnapKit
import Then

class ImageSearchResultViewController: UIViewController {
    private lazy var containerView = UIScrollView()
    lazy var navigationView = SearchNavigationView()
    
    private let screenWidth = UIScreen.main.bounds.width
    private let viewImage = UIImageView().then {
        $0.image = Const.Image.searchResultImg
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setView()
        setLayout()
        navigationView.backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.imageDidTap))
        viewImage.addGestureRecognizer(tapGesture)
        viewImage.isUserInteractionEnabled = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func imageDidTap(sender: UITapGestureRecognizer) {
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    private func setView() {
        view.addSubview(containerView)
        containerView.addSubviews(navigationView, viewImage)
    }
    
    private func setLayout() {
        containerView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        navigationView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(40)
            $0.width.equalToSuperview()
        }
        viewImage.snp.makeConstraints {
            $0.top.equalTo(navigationView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(screenWidth * 5.3)
        }
    }
}

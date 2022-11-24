//
//  BaseViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        setNavigationBar()
    }
    
    func style() {
        view.backgroundColor = .white
    }
    
    func setNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

//
//  HomeViewController.swift
//  Oliveyoung-iOS
//
//  Created by 양정연 on 2022/11/16.
//

import UIKit

import Then

class HomeViewController: UIViewController {
    
    private let friendLabel = UILabel().then {
        $0.text = "친구"
        $0.font = .systemFont(ofSize: 22, weight: .semibold)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

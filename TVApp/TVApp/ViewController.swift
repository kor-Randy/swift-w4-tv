//
//  ViewController.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/25.
//

import UIKit

class ViewController: UIViewController {
    
    private var starBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "heart.fill")
        button.style = .plain
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        self.view.backgroundColor = .white
        
    }
    
    private func initNavigationBar(){
        self.navigationItem.title = "kakaoTV"
        starBarButton.target = self
        starBarButton.action = #selector(self.tappedStar)
        navigationItem.rightBarButtonItem = starBarButton
        
    }
    
    @objc func tappedStar(){
        //TODO : 즐겨찾기 화면 전환
    }
}

//
//  ViewController.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/25.
//

import UIKit

class ViewController: UIViewController {
    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundImage = UIImage()
        searchBar.placeholder = "검색어를 입력해주세요"
        searchBar.clipsToBounds = true
        return searchBar
    }()
    
    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        return cv
    }()
    
    private var starBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "heart.fill")
        button.style = .plain
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        setSearchBar()
        view.backgroundColor = .white
    }
    
    private func initNavigationBar() {
        navigationItem.title = "kakaoTV"
        starBarButton.target = self
        starBarButton.action = #selector(tappedStar)
        navigationItem.rightBarButtonItem = starBarButton
    }
    
    private func setSearchBar() {
        view.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    @objc func tappedStar() {
        // TODO: 즐겨찾기 화면 전환
    }
}

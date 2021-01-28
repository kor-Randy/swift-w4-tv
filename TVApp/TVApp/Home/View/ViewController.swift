//
//  ViewController.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/25.
//

import UIKit

// MARK: - ViewController

class ViewController: UIViewController {
    // MARK: Internal

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>

    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        applySnapshot()
    }

    @objc func tappedStar() {
        // TODO: 즐겨찾기 화면 전환
    }

    @objc func segChanged(seg: UISegmentedControl) {
        applySnapshot()
    }

    // MARK: Private

    private lazy var dataSource: DataSource = makeDataSource()
    private let cellIdentifier = "ItemCell"

    private let viewModel = HomeViewModel()

    private var segment: UISegmentedControl = {
        let view = UISegmentedControl(items: ["오리지날", "라이브"])
        view.translatesAutoresizingMaskIntoConstraints = false
        // 세그먼트 selected 시, 설정 변경
        view.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        // 세그먼트 selected 아닐 시
        view.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)
        // 처음 1번 선택
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(segChanged(seg:)), for: .valueChanged)

        return view
    }()

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

        return cv
    }()

    private var starBarButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(systemName: "heart.fill")
        button.style = .plain
        return button
    }()

    private func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()

        snapshot.appendSections([.main])

        if segment.selectedSegmentIndex == 0 {
            snapshot.appendItems(viewModel.items.filter {
                $0.data is Original
            })
        } else {
            snapshot.appendItems(viewModel.items.filter {
                $0.data is LiveData
            })
        }

        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

    private func makeDataSource() -> DataSource {
        dataSource = DataSource(collectionView: collectionView) { [weak self] (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let self = self, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellIdentifier, for: indexPath) as? ItemCollectionViewCell else { return UICollectionViewCell() }

            if self.segment.selectedSegmentIndex == 0 {
                guard let original = item.data as? Original else { return UICollectionViewCell() }
                cell.updateUI(
                    thumbnailImage: UIImage(named: original.clip.thumbnailUrl) ?? UIImage(),
                    duration: "\(TimeConverter.shared.convertDuration(duration: original.clip.duration))",
                    title: original.clip.title,
                    channel: original.channel.name,
                    visitCount: original.channel.visitCount,
                    createTime: TimeConverter.shared.maxRangeInSubtractDate(dateStr: original.channel.createTime))
            } else {
                guard let live = item.data as? LiveData else { return UICollectionViewCell() }
                cell.updateUI(
                    thumbnailImage: UIImage(named: live.live.thumbnailUrl) ?? UIImage(),
                    duration: "\(TimeConverter.shared.convertDuration(duration: live.live.playCount))",
                    title: live.live.title,
                    channel: live.channel.name,
                    visitCount: live.channel.visitCount,
                    createTime: TimeConverter.shared.maxRangeInSubtractDate(dateStr: live.channel.createTime))
            }

            return cell
        }

        return dataSource
    }

    private func addViews() {
        initNavigationBar()
        setSearchBar()
        setSegment()
        setCollectionView()
    }

    private func initNavigationBar() {
        navigationItem.title = "kakaoTV"
        starBarButton.target = self
        starBarButton.action = #selector(tappedStar)
        navigationItem.rightBarButtonItem = starBarButton
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDataSource

extension ViewController: UICollectionViewDelegate {}

extension ViewController {
    private func setSearchBar() {
        view.addSubview(searchBar)
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }

    private func setSegment() {
        view.addSubview(segment)
        segment.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 3).isActive = true
        segment.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segment.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
    }

    private func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        collectionView.topAnchor.constraint(equalTo: segment.bottomAnchor, constant: 5).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
//        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}

// MARK: UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        var height: CGFloat
        
        let itemSpacing: CGFloat = 10
        let bottomSize: CGFloat = 40

        switch UIDevice.current.orientation {
        case .portrait:
            width = collectionView.bounds.width - itemSpacing
            height = width * 7/10 + bottomSize
        default:
            width = (collectionView.bounds.width - itemSpacing)/2
            height = width * 7/10 + bottomSize
        }

        return CGSize(width: width, height: height)
    }
}


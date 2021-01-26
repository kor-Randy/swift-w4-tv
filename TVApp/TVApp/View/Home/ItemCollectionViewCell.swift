//
//  ItemCollectionViewCell.swift
//  TVApp
//
//  Created by 지현우 on 2021/01/25.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Internal

    func updateUI(data: DataType) {
        if let data = data as? Original {
            thumbnail.image = UIImage(named: data.clip.thumbnailUrl)
            title.text = data.clip.title
            channel.text = data.channel.name
            visitCount.text = "\(data.channel.visitCount)"
        } else {
            guard let data = data as? LiveData else { return }

            thumbnail.image = UIImage(named: data.live.thumbnailUrl)
            title.text = data.live.title
            channel.text = data.channel.name
            visitCount.text = "\(data.channel.visitCount)"
        }
    }

    // MARK: Private

    private var thumbnail: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        return img
    }()

    private var title: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.automaticallyAdjustsScrollIndicatorInsets = false
        textView.textColor = .black
        textView.sizeToFit()
        return textView
    }()

    private var channel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var visitCount: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func addViews() {
        setThumbnail()
        setTitle()
        setChannel()
        setVisitCount()
    }
}

// MARK: Add UI Components
extension ItemCollectionViewCell {
    private func setThumbnail() {
        addSubview(thumbnail)
        thumbnail.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        thumbnail.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.6).isActive = true
        thumbnail.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        thumbnail.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    }

    private func setTitle() {
        addSubview(title)
        title.topAnchor.constraint(equalTo: thumbnail.bottomAnchor, constant: 10).isActive = true
        title.widthAnchor.constraint(equalTo: thumbnail.widthAnchor).isActive = true
        title.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
        title.leadingAnchor.constraint(equalTo: thumbnail.leadingAnchor).isActive = true
    }

    private func setChannel() {
        addSubview(channel)
        channel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        channel.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
    }

    private func setVisitCount() {
        addSubview(visitCount)
        visitCount.topAnchor.constraint(equalTo: channel.topAnchor).isActive = true
        visitCount.leftAnchor.constraint(equalTo: channel.rightAnchor, constant: 2).isActive = true
    }
}

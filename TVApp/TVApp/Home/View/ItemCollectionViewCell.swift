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
        self.backgroundColor = .backgroundColor
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Internal

    func updateUI(thumbnailImage: UIImage, duration: String, title: String, channel: String, visitCount: Int, createTime: String) {
        thumbnailImageView.image = thumbnailImage
        labelInThumbnail.text = duration
        titleLabel.text = title
        channelLabel.text = channel
        visitCountLabel.text = "▶︎ \(visitCount)"
        createTimeLabel.text = "• \(createTime)"
    }

    // MARK: Private
    
    private var liveLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "LIVE"
        label.isHidden = true
        return label
    }()

    private var thumbnailImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        img.contentMode = .scaleToFill
        return img
    }()

    private var labelInThumbnail: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.backgroundColor = .TextColorInImage
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var titleLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.textContainer.maximumNumberOfLines = 2
        textView.textColor = .textColor
        textView.isScrollEnabled = false
        textView.isMultipleTouchEnabled = true
        return textView
    }()

    private var channelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var visitCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var createTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func addViews() {
        setThumbnail()
        setLabelInThumbnail()
        setTitle()
        setChannel()
        setVisitCount()
        setCreateTime()
        setLive()
    }
}

// MARK: Add UI Components

extension ItemCollectionViewCell {
    private func setLive(){
        addSubview(liveLabel)
        liveLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        liveLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
    }
    private func setThumbnail() {
        addSubview(thumbnailImageView)
        thumbnailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        thumbnailImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.6).isActive = true
        thumbnailImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        thumbnailImageView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
    }

    private func setLabelInThumbnail() {
        addSubview(labelInThumbnail)
        labelInThumbnail.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor, constant: -8).isActive = true
        labelInThumbnail.bottomAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: -8).isActive = true
    }

    private func setTitle() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: thumbnailImageView.widthAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.2).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.leadingAnchor).isActive = true
    }

    private func setChannel() {
        addSubview(channelLabel)
        channelLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        channelLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
    }

    private func setVisitCount() {
        addSubview(visitCountLabel)
        visitCountLabel.topAnchor.constraint(equalTo: channelLabel.topAnchor).isActive = true
        visitCountLabel.leftAnchor.constraint(equalTo: channelLabel.rightAnchor, constant: 10).isActive = true
    }

    private func setCreateTime() {
        addSubview(createTimeLabel)
        createTimeLabel.topAnchor.constraint(equalTo: visitCountLabel.topAnchor).isActive = true
        createTimeLabel.leftAnchor.constraint(equalTo: visitCountLabel.rightAnchor, constant: 10).isActive = true
    }
}

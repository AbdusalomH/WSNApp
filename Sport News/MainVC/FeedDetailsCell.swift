//
//  FeedDetailsCell.swift
//  Sport News
//
//  Created by Abdusalom on 02/07/2024.
//

import UIKit

final class FeedDetailsCell: UICollectionViewCell {
    
    static let reuseID = "feedDetailsCells"
    
    var mockData: [FeedData] = []
    
    lazy var channelTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var channelImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        return image
    }()
    
    lazy var durationMinutes: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var feedImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var feedTextContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black//UIColor.black.withAlphaComponent(0.4)
        view.layer.opacity = 0.5
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var feedText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    
    lazy var likesIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "likes")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var likesCount: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    lazy var commentIcon: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "comment")
        return image
    }()
    
    
    lazy var commentCount: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    
    lazy var shareIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "share")
        return image
    }()
    
    
    lazy var addMark: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Mark")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        let views = [channelTitle, channelImage, durationMinutes, feedImage, feedTextContainer, feedText, likesIcon, likesCount, commentIcon, commentCount, shareIcon, addMark]

        for i in views {
            contentView.addSubview(i)
            i.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            
            channelImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            channelImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            channelImage.heightAnchor.constraint(equalToConstant: 50),
            channelImage.widthAnchor.constraint(equalToConstant: 50),
            
            channelTitle.leadingAnchor.constraint(equalTo: channelImage.trailingAnchor, constant: 8),
            channelTitle.topAnchor.constraint(equalTo: channelImage.topAnchor),
            channelTitle.heightAnchor.constraint(equalToConstant: 20),
            channelTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            durationMinutes.leadingAnchor.constraint(equalTo: channelImage.trailingAnchor, constant: 8),
            durationMinutes.topAnchor.constraint(equalTo: channelTitle.bottomAnchor, constant: 8),
            durationMinutes.heightAnchor.constraint(equalToConstant: 12),
            durationMinutes.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            feedImage.topAnchor.constraint(equalTo: channelImage.bottomAnchor, constant: 12),
            feedImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            feedImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            feedImage.heightAnchor.constraint(equalTo: feedImage.widthAnchor),
            
            feedTextContainer.bottomAnchor.constraint(equalTo: feedImage.bottomAnchor, constant: -8),
            feedTextContainer.leadingAnchor.constraint(equalTo: feedImage.leadingAnchor, constant: 8),
            feedTextContainer.trailingAnchor.constraint(equalTo: feedImage.trailingAnchor, constant: -8),
            feedTextContainer.heightAnchor.constraint(equalTo: feedImage.heightAnchor, multiplier: 0.28),
            
            feedText.bottomAnchor.constraint(equalTo: feedImage.bottomAnchor, constant: -12),
            feedText.leadingAnchor.constraint(equalTo: feedImage.leadingAnchor, constant: 12),
            feedText.trailingAnchor.constraint(equalTo: feedImage.trailingAnchor, constant: -12),
            feedText.heightAnchor.constraint(equalTo: feedImage.heightAnchor, multiplier: 0.25),
            
            likesIcon.leadingAnchor.constraint(equalTo: feedImage.leadingAnchor, constant: 8),
            likesIcon.topAnchor.constraint(equalTo: feedImage.bottomAnchor, constant: 12),
            likesIcon.heightAnchor.constraint(equalToConstant: 35),
            likesIcon.widthAnchor.constraint(equalToConstant: 35),
            likesIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
    
            likesCount.centerYAnchor.constraint(equalTo: likesIcon.centerYAnchor),
            likesCount.leadingAnchor.constraint(equalTo: likesIcon.trailingAnchor, constant: 8),
            likesCount.heightAnchor.constraint(equalToConstant: 30),
            
            commentIcon.centerYAnchor.constraint(equalTo: likesIcon.centerYAnchor),
            commentIcon.leadingAnchor.constraint(equalTo: likesCount.trailingAnchor, constant: 12),
            commentIcon.heightAnchor.constraint(equalToConstant: 35),
            commentIcon.widthAnchor.constraint(equalToConstant: 35),
            
            commentCount.centerYAnchor.constraint(equalTo: likesIcon.centerYAnchor),
            commentCount.leadingAnchor.constraint(equalTo: commentIcon.trailingAnchor, constant: 8),
            commentCount.heightAnchor.constraint(equalToConstant: 30),
            
            shareIcon.leadingAnchor.constraint(equalTo: commentCount.trailingAnchor, constant: 20),
            shareIcon.topAnchor.constraint(equalTo: feedImage.bottomAnchor, constant: 12),
            shareIcon.heightAnchor.constraint(equalToConstant: 35),
            shareIcon.widthAnchor.constraint(equalToConstant: 35),
            
            addMark.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            addMark.centerYAnchor.constraint(equalTo: shareIcon.centerYAnchor),
            addMark.heightAnchor.constraint(equalToConstant: 35),
            addMark.widthAnchor.constraint(equalToConstant: 90)
        ])
        
        likesCount.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        commentCount.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    
    func setupFeedData(datas: FeedData) {
        self.channelImage.image = UIImage(named: datas.newsResouceImageName)
        self.channelTitle.text = datas.newsResouceTitle
        self.durationMinutes.text = datas.minutes
        self.feedImage.image = UIImage(named: datas.feedImageName)
        self.feedText.text = datas.feedDescription
        self.likesCount.text = ("\(datas.likeCount) likes")
        self.commentCount.text = ("\(datas.commentCount)")
    }
}

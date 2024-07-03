//
//  FeedCell.swift
//  Sport News
//
//  Created by Abdusalom on 30/06/2024.
//

import UIKit

struct FeedData {
    let newsResouceTitle: String
    let newsResouceImageName: String
    let minutes: String
    let feedImageName: String
    let feedDescription: String
    let likeCount: Int
    let commentCount: Int
}

final class FeedCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var myMockData: [FeedData] = [
        FeedData(newsResouceTitle: "ESPN Sport News", newsResouceImageName: "20", minutes: "22 minutes", feedImageName: "30", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season. ", likeCount: 123, commentCount: 98),
        FeedData(newsResouceTitle: "BBC News", newsResouceImageName: "21", minutes: "8 minutes", feedImageName: "31", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 82, commentCount: 19),
        FeedData(newsResouceTitle: "NBC News", newsResouceImageName: "22", minutes: "15 minutes", feedImageName: "32", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 12, commentCount: 8),
        FeedData(newsResouceTitle: "MMA News", newsResouceImageName: "23", minutes: "45 minutes", feedImageName: "33", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 45, commentCount: 2),
        FeedData(newsResouceTitle: "Premier League Englang", newsResouceImageName: "24", minutes: "22 minutes", feedImageName: "33", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 222, commentCount: 222),
        FeedData(newsResouceTitle: "RT News", newsResouceImageName: "25", minutes: "10 minutes", feedImageName: "30", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 222, commentCount: 222),
        FeedData(newsResouceTitle: "MS News", newsResouceImageName: "26", minutes: "25 minutes", feedImageName: "31", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 222, commentCount: 222),
        FeedData(newsResouceTitle: "USA Football", newsResouceImageName: "27", minutes: "49 minutes", feedImageName: "21", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 222, commentCount: 222),
        FeedData(newsResouceTitle: "Soccer news", newsResouceImageName: "28", minutes: "3 minutes", feedImageName: "22", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 222, commentCount: 222),
        FeedData(newsResouceTitle: "Nahal news", newsResouceImageName: "29", minutes: "10 minutes", feedImageName: "23", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 222, commentCount: 222),
        FeedData(newsResouceTitle: "Al-Arabiya news", newsResouceImageName: "30", minutes: "20 minutes", feedImageName: "24", feedDescription: "Leicester City welcome Manchester United to King Power Stadium this Sunday for what promises to be fascinating conclusion to the season.", likeCount: 222, commentCount: 222)
    ]
    
    
    var myString: [String] = []
    
    static let reuseID = "feedListCell"
    
    lazy var feedsTable: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowlayut())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .black
        collection.register(FeedDetailsCell.self, forCellWithReuseIdentifier: FeedDetailsCell.reuseID)
        return collection
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(feedsTable)
        
        NSLayoutConstraint.activate([
            feedsTable.topAnchor.constraint(equalTo: contentView.topAnchor),
            feedsTable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            feedsTable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            feedsTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func flowlayut() -> UICollectionViewFlowLayout {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.itemSize = CGSize(width: contentView.bounds.width, height: contentView.bounds.width)
        flow.sectionInset = UIEdgeInsets(top: 12, left: 0, bottom: 0, right: 0)
        return flow
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myMockData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedDetailsCell.reuseID, for: indexPath) as! FeedDetailsCell
        cell.setupFeedData(datas: myMockData[indexPath.row])
        return cell
    }
    
    func setupData(mydata: String) {
        self.myString.append(mydata)
    }
}


extension UIColor {
    static var random: UIColor {
        return .init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    }
}

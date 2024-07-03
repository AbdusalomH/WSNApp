//
//  FeedVC.swift
//  Sport News
//
//  Created by Abdusalom on 30/06/2024.
//




import UIKit

final class FeedVC: UIViewController {
    
    
    var firstLaunch = true
    
    var categoryData: [String] = ["All", "Soccer", "Basketball", "Tennis", "Golf", "Football", "Hockey", "Baseball", "MMA", "UFC", "Boxing"]
    
    
    let logo = WSNLogo(frame: .zero)

    lazy var titleContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    
   
    lazy var titleText2: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.font = .systemFont(ofSize: 24, weight: .bold)
        title.text = "World Sport News"
        title.textAlignment = .left
        title.numberOfLines = 1
        title.minimumScaleFactor = 0.5
        return title
    }()
    
    lazy var categoriesTable: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: categoryflowlayut())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .black
        collection.register(FeedCategoryCell.self, forCellWithReuseIdentifier: FeedCategoryCell.reuseID)
        return collection
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        return view
    }()
    
    lazy var feedTable: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: feedflowlayut())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .black
        collection.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.reuseID)
        collection.isPagingEnabled = true
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.setNavigationBarHidden(true, animated: true)
        viewSetup()
    }
 
    
    
    func viewSetup() {
        view.addSubview(titleContainer)
        titleContainer.addSubview(logo)
        titleContainer.addSubview(titleText2)
        view.addSubview(categoriesTable)
        view.addSubview(feedTable)
        view.addSubview(lineView)
        
        NSLayoutConstraint.activate([
            
            titleContainer.topAnchor.constraint(equalTo: view.topAnchor),
            titleContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleContainer.heightAnchor.constraint(equalToConstant: 120),
            
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            logo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            logo.heightAnchor.constraint(equalToConstant: 30),
            logo.widthAnchor.constraint(equalToConstant: 50),
            
            titleText2.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 12),
            titleText2.centerYAnchor.constraint(equalTo: logo.centerYAnchor),
            titleText2.heightAnchor.constraint(equalToConstant: 50),
            titleText2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            categoriesTable.topAnchor.constraint(equalTo: titleContainer.bottomAnchor),
            categoriesTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoriesTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categoriesTable.heightAnchor.constraint(equalToConstant: 50),
            
            lineView.topAnchor.constraint(equalTo: categoriesTable.bottomAnchor),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 2),
            
            feedTable.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 12),
            feedTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            feedTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            feedTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func categoryflowlayut() -> UICollectionViewFlowLayout {
        let padding: CGFloat = 12
        let flawlayout = UICollectionViewFlowLayout()
        flawlayout.scrollDirection = .horizontal
        flawlayout.sectionInset = UIEdgeInsets(top: padding, left: 0, bottom: padding, right: padding)
        
        flawlayout.itemSize = CGSize(width: 90, height: 30)
        return flawlayout
    }
    
    
    func feedflowlayut() -> UICollectionViewFlowLayout {
        
        let padding: CGFloat = 0
        let flowlayut = UICollectionViewFlowLayout()
        flowlayut.minimumLineSpacing = 0
        flowlayut.scrollDirection = .horizontal
        flowlayut.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowlayut.itemSize = CGSize(width: view.bounds.width, height: view.bounds.height - 120)
        return flowlayut
    }
}


extension FeedVC: UICollectionViewDelegate, UICollectionViewDataSource  {
    
    
    //Количество ячеек на новостной ленте одинакого с ячейками категории
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case categoriesTable:
            return categoryData.count
        case feedTable:
            return categoryData.count
        default:
            break
        }
        return 0
    }
    
    
    // Выбираем ячейку с категории и переходим на вкладку новостей соотвественно выбору!
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        switch collectionView {
        case categoriesTable:
            scrollToSelectedSection(row: indexPath.row)
            feedTable.isPagingEnabled = true
        default:
            break
        }
    }
    
    
    // Инициализация простая, для первой ячейки категории сразу ставим выбор как активная
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesTable:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCategoryCell.reuseID, for: indexPath) as! FeedCategoryCell
            cell.setupData(name: categoryData[indexPath.row])
            if firstLaunch {
                let index = IndexPath(row: 0, section: 0)
                categoriesTable.selectItem(at: index, animated: true, scrollPosition: .top)
                firstLaunch.toggle()
            }
            
            return cell
            
        case feedTable:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.reuseID, for: indexPath) as! FeedCell
            cell.myString = categoryData
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView {
        case feedTable:
            let index = Int(scrollView.contentOffset.x / view.frame.width)
            let indexpath = IndexPath(row: index, section: 0)
            categoriesTable.selectItem(at: indexpath, animated: true, scrollPosition: .centeredHorizontally)
            categoriesTable.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
        default:
            break
        }
    }
    
    
    func scrollToSelectedSection(row: Int) {
        let index = IndexPath(row: row, section: 0)
        feedTable.isPagingEnabled = false
        feedTable.scrollToItem(at: index, at: .centeredVertically, animated: true)
        feedTable.selectItem(at: index, animated: true, scrollPosition: .centeredHorizontally)
    }
}

//
//  FavoritesSelectionVC.swift
//  Sport News
//
//  Created by Abdusalom on 29/06/2024.
//

import UIKit


struct NewsType {
    let title: String
    let image: String
    var selected: Bool
}

final class FavoritesSelectionVC: UIViewController {
    
    var myContent: [NewsType] = [
        NewsType(title: "Picture #1", image: "20", selected: false),
        NewsType(title: "Picture #2", image: "21", selected: false),
        NewsType(title: "Picture #3", image: "22", selected: false),
        NewsType(title: "Picture #4", image: "23", selected: false),
        NewsType(title: "Picture #5", image: "24", selected: false),
        NewsType(title: "Picture #6", image: "25", selected: false),
        NewsType(title: "Picture #7", image: "26", selected: false),
        NewsType(title: "Picture #8", image: "27", selected: false),
        NewsType(title: "Picture #0", image: "28", selected: false),
        NewsType(title: "Picture #10", image: "29", selected: false),
        NewsType(title: "Picture #11", image: "30", selected: false),
        NewsType(title: "Picture #12", image: "31", selected: false),
        NewsType(title: "Picture #13", image: "32", selected: false),
        NewsType(title: "Picture #15", image: "33", selected: false),
        NewsType(title: "Picture #16", image: "34", selected: false),
        NewsType(title: "Picture #17", image: "35", selected: false),
        NewsType(title: "Picture #18", image: "36", selected: false),
        NewsType(title: "Picture #19", image: "37", selected: false),
        NewsType(title: "Picture #20", image: "38", selected: false),
        NewsType(title: "Picture #21", image: "39", selected: false),
        NewsType(title: "Picture #22", image: "40", selected: false),
        NewsType(title: "Picture #23", image: "41", selected: false),
        NewsType(title: "Picture #24", image: "42", selected: false),
        NewsType(title: "Picture #25", image: "43", selected: false),
    ]
    
    var isSelected = false
    
    var selectedContent: [String] = []
    
 
    lazy var favoriteTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select your favorite sections to have us tailor the news to you"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    
    
    lazy var favoriteSubTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "A news feed will be formed for you, depending on the selected section"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .gray
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        return label
    }()
    
    lazy var favoriteTable: UICollectionView = {
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowlayut())
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .black
        collection.register(FavoritesSelectionCell.self, forCellWithReuseIdentifier: FavoritesSelectionCell.reuseID)
        return collection
    }()
    
    
    lazy var bottonContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.opacity = 0
        return view
    }()
    
    
    lazy var proceedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Proceed", for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .red
        button.clipsToBounds = true
        button.layer.opacity = 0
        button.addTarget(self, action: #selector(navigateToMainVC), for: .touchUpInside)
        return button
    }()
    
    @objc func navigateToMainVC() {
        let signUpVC = MainViews()
        signUpVC.modalTransitionStyle = .crossDissolve
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
    }
    
    func setupView() {
        
        view.addSubview(favoriteTitle)
        view.addSubview(favoriteSubTitle)
        view.addSubview(favoriteTable)
        view.addSubview(bottonContainerView)
        bottonContainerView.addSubview(proceedButton)
        
        NSLayoutConstraint.activate([
            
            favoriteTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            favoriteTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            favoriteTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            favoriteTitle.heightAnchor.constraint(equalToConstant: 60),
            
            favoriteSubTitle.topAnchor.constraint(equalTo: favoriteTitle.bottomAnchor, constant: 12),
            favoriteSubTitle.leadingAnchor.constraint(equalTo: favoriteTitle.leadingAnchor, constant: 10),
            favoriteSubTitle.trailingAnchor.constraint(equalTo: favoriteTitle.trailingAnchor, constant: -10),
            favoriteSubTitle.heightAnchor.constraint(equalToConstant: 40),
            
            favoriteTable.topAnchor.constraint(equalTo: favoriteSubTitle.bottomAnchor, constant: 20),
            favoriteTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            bottonContainerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            bottonContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10),
            bottonContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            bottonContainerView.heightAnchor.constraint(equalToConstant: 120),
            
            proceedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            proceedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            proceedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            proceedButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func flowlayut() -> UICollectionViewFlowLayout {
        
        let width = view.bounds.width
        let padding: CGFloat = 10
        let minimumSpacing: CGFloat = 10
        let availableWidth = width - (2 * padding) - minimumSpacing
        let cellWidth = availableWidth / 2
        
        let flawlayout = UICollectionViewFlowLayout()
        flawlayout.scrollDirection = .vertical
        flawlayout.minimumLineSpacing = minimumSpacing
        flawlayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        
        flawlayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        return flawlayout
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  !selectedContent.contains(myContent[indexPath.row].title) {
            selectedContent.append(myContent[indexPath.row].title)
            myContent[indexPath.row].selected = true
            favoriteTable.reloadData()
            print(selectedContent)
        } else {
            selectedContent.removeAll{$0 == myContent[indexPath.row].title}
            myContent[indexPath.row].selected = false
            favoriteTable.reloadData()
            print(selectedContent)
        }
        
        if selectedContent.isEmpty {
            bottonContainerView.layer.opacity = 0
            proceedButton.layer.opacity = 0
        } else {
            bottonContainerView.layer.opacity = 1
            proceedButton.layer.opacity = 1
        }
    }
}


extension FavoritesSelectionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myContent.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritesSelectionCell.reuseID, for: indexPath) as! FavoritesSelectionCell
        
        cell.setupContet(newItem: myContent[indexPath.row])
        return cell
    }
}

//
//  PrivacyVC.swift
//  Sport News
//
//  Created by Abdusalom on 29/06/2024.
//

import UIKit

final class PrivacyVC: UIViewController {
    
    lazy var logo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Logo")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleText2: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .white
        title.font = .systemFont(ofSize: 50, weight: .bold)
        title.text = "World \nSport News"
        title.textAlignment = .center
        title.numberOfLines = 2
        title.minimumScaleFactor = 0.5
        return title
    }()
    
    
    lazy var subtitleText: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .gray
        title.font = .systemFont(ofSize: 22, weight: .regular)
        title.text = "All the latest news from the world of sports"
        title.textAlignment = .center
        title.numberOfLines = 3
        title.minimumScaleFactor = 0.5
        return title
    }()
    
    
    lazy var privacyText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "The articles listed this app are taken from online news sources. They do not necessarity refrect the opinions of this app or its administration. By using the app you agree our Privacy Policy and Terms of Service"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
        
    }()
    
    lazy var proceed: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Proceed", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(navigateToFav), for: .touchUpInside)
        return button
    }()
    
    @objc func navigateToFav() {
        let signUpVC = FavoritesSelectionVC()
        signUpVC.modalTransitionStyle = .crossDissolve
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
        


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setup()
    }
    
    func setup() {
        view.addSubview(logo)
        view.addSubview(titleText2)
        view.addSubview(subtitleText)
        view.addSubview(privacyText)
        view.addSubview(proceed)
        
        NSLayoutConstraint.activate([
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logo.heightAnchor.constraint(equalToConstant: 160),
            logo.widthAnchor.constraint(equalToConstant: 290),
            
            titleText2.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            titleText2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleText2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            titleText2.heightAnchor.constraint(equalToConstant: 120),
            
            subtitleText.topAnchor.constraint(equalTo: titleText2.bottomAnchor, constant: 0),
            subtitleText.leadingAnchor.constraint(equalTo: logo.leadingAnchor, constant: 20),
            subtitleText.trailingAnchor.constraint(equalTo: logo.trailingAnchor, constant: -20),
            subtitleText.heightAnchor.constraint(equalToConstant: 90),
            
            
            
            proceed.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12),
            proceed.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            proceed.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            proceed.heightAnchor.constraint(equalToConstant: 50),
            
            
            privacyText.bottomAnchor.constraint(equalTo: proceed.topAnchor, constant: -50),
            privacyText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            privacyText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            privacyText.heightAnchor.constraint(equalToConstant: 130),
        ])
    }
}

//
//  SignUpVC.swift
//  Sport News
//
//  Created by Abdusalom on 29/06/2024.
//

import UIKit

final class SignUpVC: UIViewController {
    
    
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
    
    lazy var skip: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Skip for now", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(skipMe), for: .touchUpInside)
        return button
    }()
    
    
    @objc func skipMe() {
        let signUpVC = PrivacyVC()
        signUpVC.modalTransitionStyle = .crossDissolve
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
    lazy var login: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    lazy var signUp: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        return button
    }()
    
    
    lazy var googleSignUp: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Google"), for: .normal)
        button.setTitle("  Sign Up with Google", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        return button
    }()
    
    lazy var titleDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create an account to have full access to all functions"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.6
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func setupView() {
        
        view.addSubview(logo)
        view.addSubview(titleText2)
        view.addSubview(subtitleText)
        view.addSubview(skip)
        view.addSubview(login)
        view.addSubview(signUp)
        view.addSubview(googleSignUp)
        view.addSubview(titleDescription)
        
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
            
            skip.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            skip.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            skip.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            skip.heightAnchor.constraint(equalToConstant: 50),
            
            login.bottomAnchor.constraint(equalTo: skip.topAnchor, constant: -12),
            login.heightAnchor.constraint(equalToConstant: 50),
            login.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            login.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            signUp.bottomAnchor.constraint(equalTo: login.topAnchor, constant: -12),
            signUp.heightAnchor.constraint(equalToConstant: 50),
            signUp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            signUp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
            
            googleSignUp.bottomAnchor.constraint(equalTo: signUp.topAnchor, constant: -12),
            googleSignUp.heightAnchor.constraint(equalToConstant: 50),
            googleSignUp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            googleSignUp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            titleDescription.bottomAnchor.constraint(equalTo: googleSignUp.topAnchor, constant: -12),
            titleDescription.heightAnchor.constraint(equalToConstant: 70),
            titleDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

        ])
    }   
}

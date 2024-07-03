//
//  ViewController.swift
//  Sport News
//
//  Created by Abdusalom on 29/06/2024.
//

import UIKit
import FirebaseAuth

final class LaunchVC: UIViewController {
    
    let logo = WSNLogo(frame: .zero)
    
    let launchTitle = WSNLabel(titleText: "World \nSport News",
                                   labelTextColor: .white,
                                   fontSize: 50,
                                   numberOfLines: 2)
    
    let subtitleText = WSNLabel(titleText: "All the latest news from the world of sports",
                                 labelTextColor: .gray,
                                 fontSize: 22,
                                 numberOfLines: 3)
    
//    lazy var launchTitle: UILabel = {
//        let title = UILabel()
//        title.translatesAutoresizingMaskIntoConstraints = false
//        title.textColor = .white
//        title.font = .systemFont(ofSize: 50, weight: .bold)
//        title.text = "World \nSport News"
//        title.textAlignment = .center
//        title.numberOfLines = 2
//        title.minimumScaleFactor = 0.5
//        return title
//    }()
    
    
    
    
//    lazy var subtitleText: UILabel = {
//        let title = UILabel()
//        title.translatesAutoresizingMaskIntoConstraints = false
//        title.textColor = .gray
//        title.font = .systemFont(ofSize: 22, weight: .regular)
//        title.text = "All the latest news from the world of sports"
//        title.textAlignment = .center
//        title.numberOfLines = 3
//        title.minimumScaleFactor = 0.5
//        return title
//    }()
    

    
    lazy var sliderView: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = .red
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 0
        slider.thumbTintColor = .black
        return slider
    }()
    
    lazy var progressViewText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .darkGray
        label.text = "Please wait, loading..."
        label.textAlignment = .center
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupView()
        authenticateUser()
    }
    
    
    func authenticateUser() {
        if let savedUID = UserDefaults.standard.string(forKey: "uid") {
            // Проверка, существует ли текущий аутентифицированный пользователь с сохраненным UID
            Auth.auth().signInAnonymously { (authResult, error) in
                if let error = error {
                    print("Error signing in anonymously: \(error.localizedDescription)")
                    return
                }
                if let user = authResult?.user, user.uid == savedUID {
                    print("User is already signed in with UID: \(user.uid)")
                    // Пользователь уже аутентифицирован
                } else {
                    self.signInAnonymouslyAndSaveUID()
                }
            }
        } else {
            // Нет сохраненного UID, создаем нового анонимного пользователя
            signInAnonymouslyAndSaveUID()
        }
    }
    
    
    func signInAnonymouslyAndSaveUID() {
        Auth.auth().signInAnonymously { (authResult, error) in
            if let error = error {
                print("Error signing in anonymously: \(error.localizedDescription)")
                return
            }
            if let user = authResult?.user {
                print("Signed in anonymously with UID: \(user.uid)")
                UserDefaults.standard.set(user.uid, forKey: "uid")
                // Новый анонимный пользователь создан и UID сохранен
            }
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateSliderToMaximumValue(sliderView)
    }
    
    
    func animateSliderToMaximumValue(_ slider: UISlider) {
        UIView.animate(withDuration: 5.0, delay: 1, options: .curveEaseInOut, animations: {
            slider.setValue(slider.maximumValue, animated: true)
        }, completion: { finished in
            if finished {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.transitionToSignUpVC()
                }
            }
        })
    }
    
    
    func transitionToSignUpVC() {
        let signUpVC = SignUpVC()
        signUpVC.modalTransitionStyle = .crossDissolve
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
    
    func setupView() {
        view.addSubview(logo)
        view.addSubview(launchTitle)
        view.addSubview(subtitleText)
        view.addSubview(sliderView)
        view.addSubview(progressViewText)
        
        NSLayoutConstraint.activate([
            
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            logo.heightAnchor.constraint(equalToConstant: 160),
            logo.widthAnchor.constraint(equalToConstant: 290),
            
            launchTitle.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20),
            launchTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            launchTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            launchTitle.heightAnchor.constraint(equalToConstant: 120),
            
            subtitleText.topAnchor.constraint(equalTo: launchTitle.bottomAnchor, constant: 0),
            subtitleText.leadingAnchor.constraint(equalTo: logo.leadingAnchor),
            subtitleText.trailingAnchor.constraint(equalTo: logo.trailingAnchor),
            subtitleText.heightAnchor.constraint(equalToConstant: 90),
            
            sliderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            sliderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            sliderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sliderView.heightAnchor.constraint(equalToConstant: 50),
            
            progressViewText.bottomAnchor.constraint(equalTo: sliderView.topAnchor, constant: -8),
            progressViewText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressViewText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressViewText.heightAnchor.constraint(equalToConstant: 20)
            
        ])
    }
}


//
//  ProfileVC.swift
//  Sport News
//
//  Created by Abdusalom on 30/06/2024.
//

import UIKit

final class MainViews: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabbars()
        
    }
    
    func configureTabbars() {
        tabBar.selectedItem?.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 20, weight: .semibold)], for: .normal)
        tabBar.tintColor = .red
        tabBar.barTintColor = .lightGray
        tabBar.layer.borderWidth = 0.5
        tabBar.backgroundColor = .black
        viewControllers = [feedVC(), sectionsVC(), followVC(), profileVC()]
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tabBarHeight: CGFloat = 100  // Установите нужную высоту
        var tabBarFrame = tabBar.frame
        tabBarFrame.size.height = tabBarHeight
        tabBarFrame.origin.y = view.frame.height - tabBarHeight
        tabBar.frame = tabBarFrame
    }
    
    
    func feedVC() -> UINavigationController {
        
        let feed = FeedVC()
        feed.title = "World Sport News"
        feed.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(named: "feed"), tag: 0)
        
        return UINavigationController(rootViewController: feed)
    }
    
    func sectionsVC() -> UINavigationController {
        
        let section = SectionsVC()
        section.title = "Sections"
        section.tabBarItem = UITabBarItem(title: "Sections", image: UIImage(named: "sections"), tag: 1)

        return UINavigationController(rootViewController: section)
    }
    
    func followVC() -> UINavigationController {
        let follow = FollowVC()
        follow.title = "Follow"
        follow.tabBarItem = UITabBarItem(title: "Follow", image: UIImage(named: "follow"), tag: 2)
        return UINavigationController(rootViewController: follow)
    }
    
    func profileVC() -> UINavigationController {
        let profile = ProfileVC()
        profile.title = "Profile"
        profile.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 3)
        return UINavigationController(rootViewController: profile)
    }
}

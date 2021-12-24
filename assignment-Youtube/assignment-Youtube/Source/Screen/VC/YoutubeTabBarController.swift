//
//  YoutubeTabBarController.swift
//  assignment-Youtube
//
//  Created by 이남준 on 2021/10/22.
//

import UIKit

class YoutubeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarTextColor()
        setTabBar()
    }
    
    func setTabBarTextColor() {
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    func setTabBar() {
        guard let HomeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC"),
              let ShortsVC = self.storyboard?.instantiateViewController(withIdentifier: "ShortsVC"),
              let PlusVC = self.storyboard?.instantiateViewController(withIdentifier: "PlusVC"),
              let SubscriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "SubscriptionVC"),
              let LibraryVC = self.storyboard?.instantiateViewController(withIdentifier: "LibraryVC")
        else { return }
        
        HomeVC.tabBarItem.title = "홈"
        HomeVC.tabBarItem.image = UIImage(named: "homeIcon")
        HomeVC.tabBarItem.selectedImage = UIImage(named: "homeIconFill")
        
        ShortsVC.tabBarItem.title = "Shorts"
        ShortsVC.tabBarItem.image = UIImage(named: "shortsIcon")
        ShortsVC.tabBarItem.selectedImage = UIImage(named: "shortsIconFill")
        
        PlusVC.tabBarItem.title = "추가"
        PlusVC.tabBarItem.image = UIImage(named: "plueCircleIcon")
        PlusVC.tabBarItem.selectedImage = UIImage(named: "plueCircleIcon-1")
        
        SubscriptionVC.tabBarItem.title = "구독"
        SubscriptionVC.tabBarItem.image = UIImage(named: "subscriptionsIcon")
        SubscriptionVC.tabBarItem.selectedImage = UIImage(named: "subscriptionsIconFill")
        
        LibraryVC.tabBarItem.title = "보관함"
        LibraryVC.tabBarItem.image = UIImage(named: "LibraryIcon")
        LibraryVC.tabBarItem.selectedImage = UIImage(named: "LibraryIconFill")
        
        setViewControllers([HomeVC, ShortsVC, PlusVC, SubscriptionVC, LibraryVC], animated: true)
    }
    
}

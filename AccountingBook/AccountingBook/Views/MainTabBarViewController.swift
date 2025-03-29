//
//  MainTabBarViewController.swift
//  AccountingBook
//
//  Created by frank on 26.03.25.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBar()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTabBar()
    }
    
    private func setupTabBar() {
        let calendarVC = CalendarNavigationViewController()
        let settingsVC = SettingNavigationViewController()
        
        calendarVC.tabBarItem = UITabBarItem(title: "首頁", image: UIImage(systemName: "house"), tag: 0)
        settingsVC.tabBarItem = UITabBarItem(title: "登出", image: UIImage(systemName: "gear"), tag: 1)
        
        self.viewControllers = [calendarVC, settingsVC] // ✅ 設定 tab bar 的畫面
    }
    
}

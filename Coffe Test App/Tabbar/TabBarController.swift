//
//  TabBarController.swift
//  Coffe Test App
//
//  Created by Ivan Behichev on 29.07.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    @IBOutlet weak private var customTabBar: TabBarWithCorners!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor(named: "purple")
        delegate = self
        customTabBar.didTapButton = setupTap
    }
    
    private func setupTap() {
        self.selectedIndex = 1
    }
    
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let selectedIndex = tabBarController.viewControllers?.firstIndex(of: viewController) else {
            return true
        }
        if selectedIndex == 1 {
            return false
        }
        
        return true
    }
}

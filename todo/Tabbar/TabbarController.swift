//
//  TabbarViewController.swift
//  TODO_APP
//
//  Created by ithink on 22/06/23.
//

import UIKit

final class TabbarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        if UIDevice.current.userInterfaceIdiom == .pad {

        } else if UIDevice.current.userInterfaceIdiom == .phone{
            let homeVC = UINavigationController(rootViewController: HomeAssembly.makeViewController())
            let settingsVC = SettingViewController(viewModel: SettingViewModel())
            let listDetailVC = UINavigationController(rootViewController: ListDetailAssembly.makeViewController(selectedListItem: ListItemModel(id: nil, name: nil, backgroundColor: nil, backgroundImage: nil)))

            setViewControllers(
                [homeVC, listDetailVC, settingsVC],
                animated: true
            )
            listDetailVC.tabBarItem = UITabBarItem(title: "List Detail", image: UIImage(systemName: "person"), tag: 0)
            homeVC.tabBarItem = UITabBarItem(title: "home", image: UIImage(systemName: "house"), tag: 1)
            settingsVC.tabBarItem = UITabBarItem(title: "settings", image: UIImage(systemName: "gear"), tag: 2)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  TabBarViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import UIKit

protocol TabBarViewControllable: ViewControllable {
    var presenter: TabBarPresenterInteractable { get set }
}

protocol TabBarViewRoutable: ViewRoutable {
    func embedTabBarScreens(_ viewControllers: [ViewController], tabBarItems: [RootMenuItemViewModel])
}

final class TabBarViewController: UITabBarController, TabBarViewControllable {
    var presenter: TabBarPresenterInteractable = TabBarPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: think how to set this in Builder
        presenter.view = self
        presenter.viewDidLoad()

        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 12
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        tabBar.isTranslucent = true
        tabBar.barStyle = UIBarStyle.default
    }
}

extension TabBarViewController: TabBarViewRoutable {
    func embedTabBarScreens(_ viewControllers: [ViewController], tabBarItems: [RootMenuItemViewModel]) {
        for (viewController, viewModel) in zip(viewControllers, tabBarItems) {
            let tabBarItem = UITabBarItem(title: viewModel.title, image: viewModel.image, selectedImage: viewModel.selectedImage)
            viewController.tabBarItem = tabBarItem
        }
        
        setViewControllers(viewControllers, animated: false)
    }
}

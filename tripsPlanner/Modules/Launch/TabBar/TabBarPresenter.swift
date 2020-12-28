//
//  TabBarPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

protocol TabBarPresenterInteractable: PresenterInteractable {
    var view: (TabBarViewControllable & TabBarViewRoutable)? { get set }
}

final class TabBarPresenter {
    weak var view: (TabBarViewControllable & TabBarViewRoutable)?
}

extension TabBarPresenter: TabBarPresenterInteractable {
    func viewDidLoad() {
        let viewModels = RootMenuItem.allCases.map { RootMenuItemViewModel(menuItem: $0) }
        let childViewControllers = [TripsHistoryBuilder.build(), ViewController(), ViewController(), ViewController()]
        view?.embedTabBarScreens(childViewControllers, tabBarItems: viewModels)
    }
}

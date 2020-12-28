//
//  SideBarPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/14/20.
//

import Foundation

protocol SideBarPresenterInteractable: PresenterInteractable {
    var view: (SideBarViewControllable & SideBarViewRoutable)? { get set }
}

final class SideBarPresenter {
    weak var view: (SideBarViewControllable & SideBarViewRoutable)?

    init(view: (SideBarViewControllable & SideBarViewRoutable)) {
        self.view = view
    }
}

extension SideBarPresenter: SideBarPresenterInteractable {
    func viewDidLoad() {
        var data: [(menuItem: RootMenuItem, childOptions: [String])] = []
        for menuItem in RootMenuItem.allCases {
            switch menuItem {
            case .trips:
                data.append((menuItem: menuItem, childOptions: ["Paris", "France"]))
            case .explore, .statistics, .profile:
                data.append((menuItem: menuItem, childOptions: []))
            }
        }
        view?.applyInitialSnapshots(data: data)
    }
}

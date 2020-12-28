//
//  SplitPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/14/20.
//

import Foundation

protocol SplitPresenterInteractable: PresenterInteractable {
    var view: (SplitViewControllable & SplitViewRoutable)? { get set }
}

final class SplitPresenter {
    weak var view: (SplitViewControllable & SplitViewRoutable)?

    init(view: (SplitViewControllable & SplitViewRoutable)) {
        self.view = view
    }
}

extension SplitPresenter: SplitPresenterInteractable {
    func viewDidLoad() {
        view?.embedSplitScreens(primary: SideBarBuilder.build(delegate: self), compact: TabBarBuilder.build())
    }
}

extension SplitPresenter: SideBarDelegate {
    func didSelectMenuOption(_ item: RootMenuItem, selectedTrip: TripModel?) {
        switch item {
        case .trips:
            guard let tripModel = selectedTrip else {
                return
            }
            view?.embedSecondarySplitScreen(TripLegendBuilder.build(trip: tripModel))
        case .explore, .statistics, .profile:
            view?.embedSecondarySplitScreen(ViewController())
        }
    }
}

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
        view?.embedSplitScreens(primary: SideBarBuilder.build(),
                                secondary: TripLegendBuilder.build(trip: ServiceContainer.shared.tripsService.tripItems[0]),
                                compact: TabBarBuilder.build())
    }
}

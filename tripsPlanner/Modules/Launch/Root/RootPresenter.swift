//
//  RootPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

protocol RootPresenterInteractable: PresenterInteractable {
    var view: (RootViewControllable & RootViewRoutable)? { get set }
}

final class RootPresenter {
    weak var view: (RootViewControllable & RootViewRoutable)?

    init(view: (RootViewControllable & RootViewRoutable)) {
        self.view = view
    }
}

extension RootPresenter: RootPresenterInteractable {
    func viewDidLoad() {
        view?.embed(TabBarBuilder.build())
    }
}

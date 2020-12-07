//
//  PlanDetailsPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/3/20.
//

import Foundation

protocol PlanDetailsPresenterInteractable: PresenterInteractable {
    var view: (PlanDetailsViewControllable & PlanDetailsViewRoutable)? { get set }
}

final class PlanDetailsPresenter {
    weak var view: (PlanDetailsViewControllable & PlanDetailsViewRoutable)?

    private let plan: PlanModel
    private let mode: TripDetailMode

    init(view: (PlanDetailsViewControllable & PlanDetailsViewRoutable), plan: PlanModel, mode: TripDetailMode) {
        self.view = view
        self.plan = plan
        self.mode = mode
    }
}

extension PlanDetailsPresenter: PlanDetailsPresenterInteractable {
    func viewDidLoad() {
        view?.setup(with: plan.name, mode: mode)
    }
}

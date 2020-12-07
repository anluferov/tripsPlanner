//
//  PlaceDetailsPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/3/20.
//

import Foundation

protocol PlaceDetailsPresenterInteractable: PresenterInteractable {
    var view: (PlaceDetailsViewControllable & PlaceDetailsViewRoutable)? { get set }
}

final class PlaceDetailsPresenter {
    weak var view: (PlaceDetailsViewControllable & PlaceDetailsViewRoutable)?

    private let place: PlaceModel
    private let mode: TripDetailMode

    init(view: (PlaceDetailsViewControllable & PlaceDetailsViewRoutable), place: PlaceModel, mode: TripDetailMode) {
        self.view = view
        self.place = place
        self.mode = mode
    }
}

extension PlaceDetailsPresenter: PlaceDetailsPresenterInteractable {
    func viewDidLoad() {
        view?.setup(with: place.name, mode: mode)
        view?.embedPlacePlans(place.plans.map { PlanDetailsBuilder.build(plan: $0, mode: .read) })
    }
}

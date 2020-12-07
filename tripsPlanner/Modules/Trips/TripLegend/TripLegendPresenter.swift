//
//  TripLegendPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

protocol TripLegendPresenterInteractable: PresenterInteractable {
    var view: (TripLegendViewControllable & TripLegendViewRoutable)? { get set }

    func addDetailAction()
    func newPlaceAction()
    func newPlanAction()
    func newToDoAction()
    func newImpressionAction()
}

final class TripLegendPresenter {
    weak var view: (TripLegendViewControllable & TripLegendViewRoutable)?

    private let tripModel: TripModel

    init(view: (TripLegendViewControllable & TripLegendViewRoutable), tripModel: TripModel) {
        self.view = view
        self.tripModel = tripModel
    }
}

extension TripLegendPresenter: TripLegendPresenterInteractable {
    func viewDidLoad() {
        view?.update(viewModel: TripViewModel(model: tripModel))
        view?.embedTripPlans(tripModel.plans.map { PlanDetailsBuilder.build(plan: $0, mode: .read) })
        view?.embedPlaces(tripModel.places.map { PlaceDetailsBuilder.build(place: $0, mode: .read) })
    }

    func addDetailAction() {
        view?.showAddDetailsAlert()
    }

    func newPlaceAction() {
        let newPlace = PlaceModel(name: "", plans: [])
        view?.presentNewPlaceFlow(PlaceDetailsBuilder.build(place: newPlace, mode: .edit))
    }

    func newPlanAction() {
        let newPlan = PlanModel(name: "", type: .accommodation)
        view?.presentNewPlanFlow(PlanDetailsBuilder.build(plan: newPlan, mode: .edit))
    }

    func newToDoAction() {

    }

    func newImpressionAction() {
        
    }
}

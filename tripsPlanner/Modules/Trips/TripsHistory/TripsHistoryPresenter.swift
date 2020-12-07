//
//  TripsPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

protocol TripsHistoryPresenterInteractable: PresenterInteractable {
    var view: (TripsHistoryViewControllable & TripsHistoryViewRoutable)? { get set }

    func openTripAction(with index: Int)
    func createTripAction()
}

final class TripsHistoryPresenter {
    weak var view: (TripsHistoryViewControllable & TripsHistoryViewRoutable)?

    private let tripsService: TripsServiceProtocol = ServiceContainer.shared.tripsService

    init(view: (TripsHistoryViewControllable & TripsHistoryViewRoutable)) {
        self.view = view
    }
}

extension TripsHistoryPresenter: TripsHistoryPresenterInteractable {
    func viewDidLoad() {
        view?.update(viewModels: tripsService.tripItems.map { TripCollectionViewCellViewModel(model: $0) })
    }

    func openTripAction(with index: Int) {
        guard let tripModel = tripsService.tripItems[safe: index] else {
            return
        }

        view?.presentTripLegend(TripLegendBuilder.build(trip: tripModel))
    }

    func createTripAction() {
        view?.presentTripCreationFlow(TripCreationNavigatorBuilder.build(delegate: self))
    }
}

extension TripsHistoryPresenter: TripCreationNavigatorDelegate {
    func didFinishSaveTripFlow() {
        view?.update(viewModels: tripsService.tripItems.map { TripCollectionViewCellViewModel(model: $0) })
        view?.dismissTripCreationFlow()
    }
}

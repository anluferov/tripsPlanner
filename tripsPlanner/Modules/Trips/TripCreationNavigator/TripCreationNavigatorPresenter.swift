//
//  TripCreationNavigatorPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/6/20.
//

import Foundation

protocol TripCreationNavigatorDelegate: AnyObject {
    func didFinishSaveTripFlow()
}

protocol TripCreationNavigatorPresenterInteractable: PresenterInteractable {
    var view: (TripCreationNavigatorViewControllable & TripCreationNavigatorViewRoutable)? { get set }

    func createTripAction(tripName: String)
    func createPlaceAction(placeName: String)
}

final class TripCreationNavigatorPresenter {
    weak var view: (TripCreationNavigatorViewControllable & TripCreationNavigatorViewRoutable)?

    private weak var delegate: TripCreationNavigatorDelegate?

    @ServiceDependency private(set) var tripsService: TripsServiceProtocol

    private var placesModels: [PlaceModel] = []

    init(view: (TripCreationNavigatorViewControllable & TripCreationNavigatorViewRoutable), delegate: TripCreationNavigatorDelegate?) {
        self.view = view
        self.delegate = delegate
    }
}

extension TripCreationNavigatorPresenter: TripCreationNavigatorPresenterInteractable {
    func viewDidLoad() {

    }

    func createTripAction(tripName: String) {
        tripsService.saveTrip(TripModel(name: tripName, places: placesModels, plans: []))
        delegate?.didFinishSaveTripFlow()
    }

    func createPlaceAction(placeName: String) {
        let place = PlaceModel(name: placeName, plans: [])
        placesModels.append(place)
        view?.embedPlace(PlaceDetailsBuilder.build(place: place, mode: .read))
        view?.resetPlaceName()
    }
}

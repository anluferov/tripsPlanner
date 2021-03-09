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

    //TODO: refactor methods to one ore several aka updateTrip methods
    func updateTripTitleAction(_ title: String)
    func updatePlaceAction(placeName: String)
    func createTripAction()
}

final class TripCreationNavigatorPresenter {
    weak var view: (TripCreationNavigatorViewControllable & TripCreationNavigatorViewRoutable)?

    private weak var delegate: TripCreationNavigatorDelegate?

    private var tripName: String = ""

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

    func updateTripTitleAction(_ title: String) {
        tripName = title
    }

    func updatePlaceAction(placeName: String) {
        let place = PlaceModel(name: placeName, plans: [])
        placesModels.append(place)
    }

    func createTripAction() {
        tripsService.saveTrip(TripModel(name: tripName, places: placesModels, plans: []))
        delegate?.didFinishSaveTripFlow()
    }
}

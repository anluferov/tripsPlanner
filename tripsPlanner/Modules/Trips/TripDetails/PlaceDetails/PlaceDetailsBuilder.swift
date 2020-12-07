//
//  PlaceDetailsBuilder.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/3/20.
//

import Foundation

final class PlaceDetailsBuilder {
    static func build(place: PlaceModel, mode: TripDetailMode) -> ViewController {
        guard let vc = R.storyboard.placeDetails.instantiateInitialViewController() else {
            fatalError("Unable to instantiate VC")
        }

        let presenter = PlaceDetailsPresenter(view: vc, place: place, mode: mode)
        vc.presenter = presenter
        return vc
    }
}

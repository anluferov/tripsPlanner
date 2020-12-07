//
//  TripLegendBuilder.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

final class TripLegendBuilder {
    static func build(trip: TripModel) -> ViewController {
        guard let vc = R.storyboard.tripLegend.instantiateInitialViewController() else {
            fatalError("Unable to instantiate TripLegend VC")
        }

        let presenter = TripLegendPresenter(view: vc, tripModel: trip)
        vc.presenter = presenter
        return vc
    }
}

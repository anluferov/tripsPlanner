//
//  TripLegendViewModel.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

//TODO: stay only general info in this view model
struct TripViewModel {
    let name: String
//    let places: [PlaceViewModel]
    let plans: [PlanViewModel]

    init(model: TripModel) {
        name = model.name
//        places = model.placeItems.map { PlaceViewModel(model: $0) }
        plans = model.plans.map { PlanViewModel(model: $0) }
    }
}

struct PlaceViewModel {
    let name: String
    let plans: [PlanViewModel]

    init(model: PlaceModel) {
        name = model.name
        plans = model.plans.map { PlanViewModel(model: $0) }
    }
}

struct PlanViewModel {
    let name: String

    init(model: PlanModel) {
        name = model.name
    }
}

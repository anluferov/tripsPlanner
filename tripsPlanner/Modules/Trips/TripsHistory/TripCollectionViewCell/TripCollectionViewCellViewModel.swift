//
//  TripCollectionViewCellViewModel.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

struct TripCollectionViewCellViewModel {
    let name: String

    init(model: TripModel) {
        name = model.name
    }
}

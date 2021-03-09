//
//  TripCreationBasicInfoViewModel.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 3/9/21.
//

import Foundation

struct TripCreationBasicInfoViewModel {
    let stepTitle: String = "Set Trip name and places you plan to visit"
    let placeholderTripTitle: String = "Enter trip name"
    let tripStartDateTitle: String = "Trip Start Date"
    let tripStartDateDefaultDate: Date = Date()
    let tripEndDateTitle: String = "Trip End Date"
    let tripEndDateDefaultDate: Date = Date()
}

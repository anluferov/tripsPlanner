//
//  PlanModel.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

struct PlanModel {
    let name: String
//    let startDate: Date
//    let endDate: Date
    let type: PlanType
}

enum PlanType {
    case flight
    case car
    case accommodation
}

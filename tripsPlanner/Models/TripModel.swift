//
//  TripModel.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

struct TripModel {
    let id: Int
    let name: String
    let startDate: Date
    let endDate: Date
    let places: [PlaceModel]
    let plans: [PlanModel]
    let todos: [ToDoModel]
    let impressions: [ImpressionModel]

    init(name: String, places: [PlaceModel], plans: [PlanModel]) {
        id = Int.random(in: 1..<100)

        self.name = name
        self.places = places
        self.plans = plans

        startDate = Date()
        endDate = Date()
        todos = []
        impressions = []
    }
}

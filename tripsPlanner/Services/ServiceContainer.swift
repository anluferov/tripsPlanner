//
//  ServiceContainer.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

class ServiceContainer {
    static let shared = ServiceContainer()

    let tripsService: TripsServiceProtocol

    init() {
        tripsService = TripsService()
    }
}

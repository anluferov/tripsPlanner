//
//  TripsServiceProtocol.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

protocol TripsServiceProtocol {
    var tripItems: [TripModel] { get }

    func saveTrip(_ tripModel: TripModel)
    func updateTrip(_ tripModel: TripModel)
    func deleteTrip()
}

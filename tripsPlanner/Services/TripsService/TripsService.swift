//
//  TripsService.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

class TripsService: TripsServiceProtocol {

    //TODO: mock data temporary decision
    var tripItems: [TripModel] = []

    init() {
//        tripItems = prepareTripsMockData()
    }

    func saveTrip(_ tripModel: TripModel) {
        tripItems.append(tripModel)
    }

    func updateTrip(_ tripModel: TripModel) {
        
    }

    func deleteTrip() {

    }
}

private extension TripsService {
    //TODO: mock data temporary decision
//    func prepareTripsMockData() -> [TripModel] {
//
//        let milanPlans = [PlanModel(name: "Hotel near canal", type: .accommodation), PlanModel(name: "Check in rent car", type: .car)]
//        let romePlans = [PlanModel(name: "Hotel in center", type: .accommodation), PlanModel(name: "Check out rent car", type: .car)]
//        let globalItalyPlans = [PlanModel(name: "Flight to Italy", type: .flight), PlanModel(name: "Flight from Italy", type: .flight)]
//        let italyTrip = TripModel(name: "Italy Trip",
//                                  placeItems: [PlaceModel(name: "Milan", plans: milanPlans), PlaceModel(name: "Rome", plans: romePlans)],
//                                  planItems: globalItalyPlans)
//
//        let budvaPlans = [PlanModel(name: "Hotel in Budva", type: .accommodation), PlanModel(name: "Rent car", type: .car)]
//        let globalMontenegroPlans = [PlanModel(name: "Flight to Montenegro", type: .flight), PlanModel(name: "Flight from Montenegro", type: .flight)]
//        let montenegroTrip = TripModel(name: "Montenegro Trip",
//                                       placeItems: [PlaceModel(name: "Budva", plans: budvaPlans)],
//                                       planItems: globalMontenegroPlans)
//
//        return [italyTrip, montenegroTrip]
//    }
}

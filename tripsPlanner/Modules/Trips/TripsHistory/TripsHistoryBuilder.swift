//
//  TripsBuilder.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

final class TripsHistoryBuilder {
    static func build() -> ViewController {
        guard let tripsHistoryNavigation = R.storyboard.tripsHistory.instantiateInitialViewController(),
              let vc = tripsHistoryNavigation.topViewController as? TripsHistoryViewController  else {
            fatalError("Unable to instantiate TripsHistory VC")
        }

        let presenter = TripsHistoryPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}

//
//  TripCreationNavigatorBuilder.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/6/20.
//

import Foundation

final class TripCreationNavigatorBuilder {
    static func build(delegate: TripCreationNavigatorDelegate?) -> ViewController {
        guard let vc = R.storyboard.tripCreationNavigator.instantiateInitialViewController() else {
            fatalError("Unable to instantiate VC")
        }

        let presenter = TripCreationNavigatorPresenter(view: vc, delegate: delegate)
        vc.presenter = presenter
        return vc
    }
}

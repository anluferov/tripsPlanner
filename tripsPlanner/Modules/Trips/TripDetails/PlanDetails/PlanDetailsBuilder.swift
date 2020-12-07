//
//  PlanDetailsBuilder.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/3/20.
//

import Foundation

final class PlanDetailsBuilder {
    static func build(plan: PlanModel, mode: TripDetailMode) -> ViewController {
        guard let vc = R.storyboard.planDetails.instantiateInitialViewController() else {
            fatalError("Unable to instantiate VC")
        }

        let presenter = PlanDetailsPresenter(view: vc, plan: plan, mode: mode)
        vc.presenter = presenter
        return vc
    }
}

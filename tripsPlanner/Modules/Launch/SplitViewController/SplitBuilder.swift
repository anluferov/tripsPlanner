//
//  SplitBuilder.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/14/20.
//

import UIKit

final class SplitBuilder {
    static func build() -> UIViewController {
        let vc = SplitViewController(style: .doubleColumn)
        let presenter = SplitPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}

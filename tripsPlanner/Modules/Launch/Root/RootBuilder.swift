//
//  RootBuilder.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

final class RootBuilder {
    static func build() -> ViewController {
        let vc = RootViewController()
        let presenter = RootPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}

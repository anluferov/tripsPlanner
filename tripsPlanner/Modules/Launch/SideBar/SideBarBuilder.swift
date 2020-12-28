//
//  SideBarBuilder.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/14/20.
//

import Foundation

final class SideBarBuilder {
    static func build() -> ViewController {
        guard let vc = R.storyboard.sideBar.instantiateInitialViewController() else {
            fatalError("Unable to instantiate VC")
        }

        let presenter = SideBarPresenter(view: vc)
        vc.presenter = presenter
        return vc
    }
}

//
//  View.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import UIKit

class ViewController: UIViewController {
    deinit {
        print("Deinit - \(self)")
    }

    func addChild(viewController: UIViewController, into stackView: UIStackView) {
        addChild(viewController)
        stackView.addArrangedSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    func addChild(viewController: UIViewController) {
        addChild(viewController)
        viewController.view.frame = view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }

    func removeChild(viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
}

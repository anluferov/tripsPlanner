//
//  RootViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import UIKit

protocol RootViewControllable: ViewControllable {
    var presenter: RootPresenterInteractable? { get set }
}

protocol RootViewRoutable: ViewRoutable {
    func embed(_ viewController: UIViewController)
}

final class RootViewController: ViewController, RootViewControllable {
    var presenter: RootPresenterInteractable?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension RootViewController: RootViewRoutable {
    func embed(_ viewController: UIViewController) {
        addChild(viewController: viewController)
    }
}

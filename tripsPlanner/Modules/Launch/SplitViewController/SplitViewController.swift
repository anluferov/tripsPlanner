//
//  SplitViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/14/20.
//

import UIKit

protocol SplitViewControllable: ViewControllable {
    var presenter: SplitPresenterInteractable? { get set }
}

protocol SplitViewRoutable: ViewRoutable {
//    func embedSplitScreens(primary: UIViewController, supplementary: UIViewController, secondary: UIViewController, compact: UIViewController)
    func embedSplitScreens(primary: UIViewController, secondary: UIViewController, compact: UIViewController)
}

final class SplitViewController: UISplitViewController, SplitViewControllable {
    var presenter: SplitPresenterInteractable?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
}

extension SplitViewController: SplitViewRoutable {
//    func embedSplitScreens(primary: UIViewController, supplementary: UIViewController, secondary: UIViewController, compact: UIViewController) {
//        setViewController(primary, for: .primary)
//        setViewController(supplementary, for: .supplementary)
//        setViewController(secondary, for: .secondary)
//        setViewController(compact, for: .compact)
//    }

    func embedSplitScreens(primary: UIViewController, secondary: UIViewController, compact: UIViewController) {
        setViewController(primary, for: .primary)
        setViewController(secondary, for: .secondary)
        setViewController(compact, for: .compact)
    }
}

private extension SplitViewController {
    func setupUI() {
        preferredDisplayMode = .twoBesideSecondary
        preferredSplitBehavior = .tile
    }
}

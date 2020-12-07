//
//  PlaceDetailsViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/3/20.
//

import UIKit

protocol PlaceDetailsViewControllable: ViewControllable {
    var presenter: PlaceDetailsPresenterInteractable? { get set }

    func setup(with placeName: String, mode: TripDetailMode)
}

protocol PlaceDetailsViewRoutable: ViewRoutable {
    func embedPlacePlans(_ viewControllers: [ViewController])
}

final class PlaceDetailsViewController: ViewController {
    var presenter: PlaceDetailsPresenterInteractable?

    @IBOutlet private weak var readModeContainer: UIView!
    @IBOutlet private weak var readModePlaceNameLabel: UILabel!
    @IBOutlet private weak var readModeDetailsStackView: UIStackView!

    @IBOutlet private weak var editModeContainer: UIView!
    @IBOutlet private weak var editModeTitleLabel: UILabel!
    @IBOutlet private weak var editModePlaceNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    @IBAction private func editPlaceAction(_ sender: Any) {
        
    }
}

extension PlaceDetailsViewController: PlaceDetailsViewControllable {
    func setup(with placeName: String, mode: TripDetailMode) {
        switch mode {
        case .read:
            editModeContainer.isHidden = true
            readModePlaceNameLabel.text = placeName
        case .edit:
            readModeContainer.isHidden = true
        }
    }
}

extension PlaceDetailsViewController: PlaceDetailsViewRoutable {
    func embedPlacePlans(_ viewControllers: [ViewController]) {
        viewControllers.forEach { addChild(viewController: $0, into: readModeDetailsStackView) }
    }
}

private extension PlaceDetailsViewController {
    func setupUI() {
        editModePlaceNameTextField.backgroundColor = .white
    }
}

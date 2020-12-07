//
//  TripCreationNavigatorViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/6/20.
//

import UIKit

protocol TripCreationNavigatorViewControllable: ViewControllable {
    var presenter: TripCreationNavigatorPresenterInteractable? { get set }

    func resetPlaceName()
}

protocol TripCreationNavigatorViewRoutable: ViewRoutable {
    func embedPlace(_ viewController: ViewController)
}

final class TripCreationNavigatorViewController: ViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tripHintLabel: UILabel!
    @IBOutlet private weak var tripNameTextField: UITextField!
    @IBOutlet private weak var placesHintLabel: UILabel!
    @IBOutlet private weak var placeNameTextField: UITextField!
    @IBOutlet private weak var placesContainerStackView: UIStackView!
    @IBOutlet private weak var addPlaceButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!

    var presenter: TripCreationNavigatorPresenterInteractable?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    @IBAction private func tapNextButtonAction(_ sender: Any) {
        guard let tripName = tripNameTextField.text else {
            return
        }
        presenter?.createTripAction(tripName: tripName)
    }
    
    @IBAction private func tapAddPlacePreviewAction(_ sender: Any) {
        guard let placeName = placeNameTextField.text else {
            return
        }
        presenter?.createPlaceAction(placeName: placeName)
    }
}

extension TripCreationNavigatorViewController: TripCreationNavigatorViewControllable {
    func resetPlaceName() {
        placeNameTextField.text = ""
    }
}

extension TripCreationNavigatorViewController: TripCreationNavigatorViewRoutable {
    func embedPlace(_ viewController: ViewController) {
        addChild(viewController: viewController, into: placesContainerStackView)
    }
}

private extension TripCreationNavigatorViewController {
    func setupUI() {
        titleLabel.text = "Step 1: Set Trip name and places you plan to visit"
        tripHintLabel.text = "Enter trip name"
        placesHintLabel.text = "Enter place name"

        tripNameTextField.addTarget(self, action: #selector(tripNameDidChange(_:)), for: .editingChanged)
        placeNameTextField.addTarget(self, action: #selector(placeNameDidChange(_:)), for: .editingChanged)

        addPlaceButton.isEnabled = false
        nextButton.isEnabled = false
    }

    @objc func tripNameDidChange(_ textField: UITextField) {
        if let tripName = tripNameTextField.text, !tripName.isEmpty, !nextButton.isEnabled {
            nextButton.isEnabled = true
        }
    }

    @objc func placeNameDidChange(_ textField: UITextField) {
        if let placeName = placeNameTextField.text, !placeName.isEmpty, !addPlaceButton.isEnabled {
            addPlaceButton.isEnabled = true
        }
    }
}

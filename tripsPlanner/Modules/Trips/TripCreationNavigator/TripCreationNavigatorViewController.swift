//
//  TripCreationNavigatorViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/6/20.
//

import UIKit

protocol TripCreationNavigatorViewControllable: ViewControllable {
    var presenter: TripCreationNavigatorPresenterInteractable? { get set }
}

protocol TripCreationNavigatorViewRoutable: ViewRoutable {

}

final class TripCreationNavigatorViewController: ViewController, TripCreationNavigatorViewControllable, TripCreationNavigatorViewRoutable {
    @IBOutlet private weak var stepContainerView: UIView!
    @IBOutlet private weak var nextButton: UIButton!

    var presenter: TripCreationNavigatorPresenterInteractable?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    @IBAction private func tapNextButtonAction(_ sender: Any) {
        presenter?.createTripAction()
    }
}

extension TripCreationNavigatorViewController: TripCreationBasicInfoViewDelegate {
    func didUpdateTitle(_ title: String) {
        if !title.isEmpty, !nextButton.isEnabled {
            nextButton.isEnabled = true
            presenter?.updateTripTitleAction(title)
        }
    }
}

private extension TripCreationNavigatorViewController {
    func setupUI() {
        nextButton.isEnabled = false
        nextButton.applyDefaultButtonStyle()
        prepareTripCreationBasicInfoStep()
    }

    func prepareTripCreationBasicInfoStep() {
        let basicTripInfoStep = TripCreationBasicInfoView()
        basicTripInfoStep.update(viewModel: TripCreationBasicInfoViewModel())
        basicTripInfoStep.delegate = self

        stepContainerView.addSubview(basicTripInfoStep)
        NSLayoutConstraint.activate([
            stepContainerView.leadingAnchor.constraint(equalTo: basicTripInfoStep.leadingAnchor),
            stepContainerView.trailingAnchor.constraint(equalTo: basicTripInfoStep.trailingAnchor),
            stepContainerView.topAnchor.constraint(equalTo: basicTripInfoStep.topAnchor),
            stepContainerView.bottomAnchor.constraint(equalTo: basicTripInfoStep.bottomAnchor)
        ])
    }
}

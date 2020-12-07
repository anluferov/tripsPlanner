//
//  TripLegendViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import UIKit

protocol TripLegendViewControllable: ViewControllable {
    var presenter: TripLegendPresenterInteractable? { get set }

    func update(viewModel: TripViewModel)
    func showAddDetailsAlert()
}

protocol TripLegendViewRoutable: ViewRoutable {
    func embedTripPlans(_ viewControllers: [ViewController])
    func embedPlaces(_ viewControllers: [ViewController])

    func presentNewPlaceFlow(_ viewController: ViewController)
    func dismissNewPlaceFlow()
    func presentNewPlanFlow(_ viewController: ViewController)
    func dismissNewPlanFlow()
}

final class TripLegendViewController: ViewController {
    @IBOutlet private weak var legendTitleLabel: UILabel!
    @IBOutlet private weak var tripDetailsStackViewContainer: UIStackView!
    @IBOutlet private weak var placesStackViewContainer: UIStackView!

    var presenter: TripLegendPresenterInteractable?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    @IBAction private func tapEditTripInfoAction(_ sender: Any) {
        
    }

    @IBAction private func tapAddTripDetailAction(_ sender: Any) {
        presenter?.addDetailAction()
    }
}

extension TripLegendViewController: TripLegendViewControllable {
    func update(viewModel: TripViewModel) {
        legendTitleLabel.text = viewModel.name
        legendTitleLabel.textColor = .blue
    }

    func showAddDetailsAlert() {
        let alert = UIAlertController(title: "Add new trip detail", message: "Select detail type", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "New place", style: .default, handler: { _ in self.presenter?.newPlaceAction() }))
        alert.addAction(UIAlertAction(title: "New plan", style: .default, handler: { _ in self.presenter?.newPlanAction() }))
        alert.addAction(UIAlertAction(title: "New todo", style: .default, handler: { _ in self.presenter?.newToDoAction() }))
        alert.addAction(UIAlertAction(title: "New impression", style: .default, handler: { _ in self.presenter?.newImpressionAction() }))
        present(alert, animated: true, completion: nil)
    }
}

extension TripLegendViewController: TripLegendViewRoutable {
    func embedTripPlans(_ viewControllers: [ViewController]) {
        viewControllers.forEach { addChild(viewController: $0, into: tripDetailsStackViewContainer) }
    }

    func embedPlaces(_ viewControllers: [ViewController]) {
        viewControllers.forEach { addChild(viewController: $0, into: placesStackViewContainer) }
    }

    func presentNewPlaceFlow(_ viewController: ViewController) {
        present(viewController, animated: true)
    }

    func dismissNewPlaceFlow() {
        dismiss(animated: true)
    }

    func presentNewPlanFlow(_ viewController: ViewController) {
        present(viewController, animated: true)
    }

    func dismissNewPlanFlow() {
        dismiss(animated: true)
    }
}

//
//  PlanDetailsViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/3/20.
//

import UIKit

protocol PlanDetailsViewControllable: ViewControllable {
    var presenter: PlanDetailsPresenterInteractable? { get set }

    func setup(with planName: String, mode: TripDetailMode)
}

protocol PlanDetailsViewRoutable: ViewRoutable {

}

final class PlanDetailsViewController: ViewController {
    var presenter: PlanDetailsPresenterInteractable?

    @IBOutlet private weak var readModeContainer: UIView!
    @IBOutlet private weak var readModePlanNameLabel: UILabel!
    
    @IBOutlet private weak var editModeContainer: UIView!
    @IBOutlet private weak var editModeTitleLabel: UILabel!
    @IBOutlet private weak var editModePlanNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    @IBAction private func editPlanAction(_ sender: Any) {

    }
}

extension PlanDetailsViewController: PlanDetailsViewControllable {
    func setup(with planName: String, mode: TripDetailMode) {
        switch mode {
        case .read:
            editModeContainer.isHidden = true
            readModePlanNameLabel.text = planName
        case .edit:
            readModeContainer.isHidden = true
        }
    }
}

extension PlanDetailsViewController: PlanDetailsViewRoutable {

}

private extension PlanDetailsViewController {
    func setupUI() {
        editModePlanNameTextField.backgroundColor = .white
    }
}

//
//  TripCreationBasicInfoView.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 3/9/21.
//

import UIKit

protocol TripCreationBasicInfoViewDelegate: AnyObject {
    func didUpdateTitle(_ title: String)
}

final class TripCreationBasicInfoView: XIBView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tripTitleTextView: UnderlinedTextField!
    @IBOutlet private weak var startDateTripField: UnderlinedDateField!
    @IBOutlet private weak var endDateTripField: UnderlinedDateField!
    
    weak var delegate: TripCreationBasicInfoViewDelegate?

    override func setupUI() {
        tripTitleTextView.delegate = self
    }
}

extension TripCreationBasicInfoView: UnderlinedTextFieldDelegate {
    func didTextFieldChange(text: String) {
        delegate?.didUpdateTitle(text)
    }
}

extension TripCreationBasicInfoView {
    func update(viewModel: TripCreationBasicInfoViewModel) {
        titleLabel.text = viewModel.stepTitle
        tripTitleTextView.update(placeholder: viewModel.placeholderTripTitle)
        startDateTripField.update(title: viewModel.tripStartDateTitle)
        startDateTripField.update(date: viewModel.tripStartDateDefaultDate)
        endDateTripField.update(title: viewModel.tripEndDateTitle)
    }
}

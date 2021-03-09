//
//  UnderlinedDateField.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 3/9/21.
//

import UIKit

protocol UnderlinedDateFieldDelegate: AnyObject {
    func didDatePickerChange(date: Date)
}

final class UnderlinedDateField: XIBView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var coloredLineView: UIView!
    @IBOutlet private weak var datePicker: UIDatePicker!
    
    weak var delegate: UnderlinedDateFieldDelegate?

    override func setupUI() {
        update(underlineColor: R.color.illuminating())
    }

    @IBAction private func datePickerDateChanged(_ sender: Any) {
        delegate?.didDatePickerChange(date: datePicker.date)
    }
}

extension UnderlinedDateField {
    func update(title: String) {
        titleLabel.text = title
    }

    func update(date: Date) {
        datePicker.date = date
    }

    func update(underlineColor: UIColor?) {
        coloredLineView.backgroundColor = underlineColor
    }
}

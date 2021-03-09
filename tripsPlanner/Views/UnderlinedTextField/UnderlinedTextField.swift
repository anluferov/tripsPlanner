//
//  CustomTextField.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 3/9/21.
//

import UIKit

protocol UnderlinedTextFieldDelegate: AnyObject {
    func didTextFieldChange(text: String)
}

final class UnderlinedTextField: XIBView {
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var coloredLineView: UIView!

    weak var delegate: UnderlinedTextFieldDelegate?

    override func setupUI() {
        update(underlineColor: R.color.illuminating())

        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.didTextFieldChange(text: textField.text ?? "")
    }
}

extension UnderlinedTextField {
    func update(placeholder: String) {
        textField.placeholder = placeholder
    }

    func update(underlineColor: UIColor?) {
        coloredLineView.backgroundColor = underlineColor
    }
}

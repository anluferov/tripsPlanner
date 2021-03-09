//
//  UIView+Extensions.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 3/9/21.
//

import UIKit

extension UIView {
    func applyDefaultShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 16.0
    }

    func applyDefaultButtonStyle() {
        guard let button = self as? UIButton else {
            return
        }

        button.layer.cornerRadius = 12.0
        button.backgroundColor = R.color.illuminating()
        button.applyDefaultShadow()
        button.tintColor = R.color.ultimateGray()
        button.setTitleColor(R.color.ultimateGray(), for: .normal)
    }
}

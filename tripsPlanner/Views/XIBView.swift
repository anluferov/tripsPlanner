//
//  XIBView.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 3/9/21.
//

import UIKit

class XIBView: UIView {
    @IBOutlet private var rootView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func setupUI() {}
}

private extension XIBView {
    func commonInit() {
        guard let nibName = type(of: self).description().components(separatedBy: ".").last,
              let value = Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView else {
            fatalError("unable to load xib view \(self)")
        }
        backgroundColor = .clear
        rootView = value

        translatesAutoresizingMaskIntoConstraints = false
        rootView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(rootView)
        rootView.frame = bounds
        rootView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0).isActive = true
        rootView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 1.0).isActive = true
        rootView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        rootView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        setupUI()
    }
}

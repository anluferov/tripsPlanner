//
//  TripCollectionViewCell.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import UIKit

class TripCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var backgroundContentView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear

        backgroundContentView.backgroundColor = R.color.illuminating()
        backgroundContentView.layer.cornerRadius = 12.0
        backgroundContentView.applyDefaultShadow()
    }

    func update(description: String) {
        descriptionLabel.text = description
    }
}

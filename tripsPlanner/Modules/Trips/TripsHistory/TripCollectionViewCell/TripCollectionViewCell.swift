//
//  TripCollectionViewCell.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import UIKit

class TripCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .purple
    }

    func update(description: String) {
        descriptionLabel.text = description
    }
}

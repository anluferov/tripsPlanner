//
//  TabBarItemViewModel.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import UIKit

struct RootMenuItemViewModel: Hashable {
    let title: String
    let image: UIImage?
    let selectedImage: UIImage?

    init(menuItem: RootMenuItem) {
        switch menuItem {
        case .trips:
            title = "Trips"
            image = UIImage(systemName: "text.alignleft")
            selectedImage = UIImage(systemName: "text.redaction")
        case .explore:
            title = "Explore"
            image = UIImage(systemName: "paperplane")
            selectedImage = UIImage(systemName: "paperplane.fill")
        case .statistics:
            title = "Statistics"
            image = UIImage(systemName: "chart.pie")
            selectedImage = UIImage(systemName: "chart.pie.fill")
        case .profile:
            title = "Profile"
            image = UIImage(systemName: "person.crop.rectangle")
            selectedImage = UIImage(systemName: "person.crop.rectangle.fill")
        }
    }
}

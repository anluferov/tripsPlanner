//
//  TabBarItemViewModel.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import UIKit

struct TabBarItemViewModel {
    let title: String
    let image: UIImage?
    let selectedImage: UIImage?

    init(tabBarItem: TabBarItem) {
        switch tabBarItem {
        case .trips:
            title = "Trips"
            image = R.image.trips()
            selectedImage = R.image.trips()
        case .explore:
            title = "Explore"
            image = R.image.explore()
            selectedImage = R.image.explore()
        case .statistics:
            title = "statistics"
            image = R.image.statistics()
            selectedImage = R.image.statistics()
        case .profile:
            title = "Profile"
            image = R.image.profile()
            selectedImage = R.image.profile()
        }
    }
}

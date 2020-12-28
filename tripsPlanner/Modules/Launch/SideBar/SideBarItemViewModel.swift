//
//  SideBarItemViewModel.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/28/20.
//

import UIKit

struct SideBarItemViewModel: Hashable {
    private let identifier = UUID()

    let title: String
    let image: UIImage?
    let hasChildOptions: Bool

    init(title: String, image: UIImage? = nil, hasChildOptions: Bool) {
        self.title = title
        self.image = image
        self.hasChildOptions = hasChildOptions
    }
}

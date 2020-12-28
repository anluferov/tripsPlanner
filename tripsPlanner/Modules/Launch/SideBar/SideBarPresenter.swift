//
//  SideBarPresenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/14/20.
//

import Foundation

protocol SideBarDelegate: AnyObject {
    func didSelectMenuOption(_ item: RootMenuItem, selectedTrip: TripModel?)
}

protocol SideBarPresenterInteractable: PresenterInteractable {
    var view: (SideBarViewControllable & SideBarViewRoutable)? { get set }

    func selectMenuOptionAction(with indexPath: IndexPath)
}

final class SideBarPresenter {
    weak var view: (SideBarViewControllable & SideBarViewRoutable)?

    private weak var delegate: SideBarDelegate?

    private let rootMenuOptions: [RootMenuItem] = [.profile, .explore, .statistics]
    private var tripsMenuItems: [TripModel] = []

    private let tripsService: TripsServiceProtocol = ServiceContainer.shared.tripsService

    init(view: (SideBarViewControllable & SideBarViewRoutable), delegate: SideBarDelegate?) {
        self.view = view
        self.delegate = delegate
    }
}

extension SideBarPresenter: SideBarPresenterInteractable {
    func viewDidLoad() {
        tripsMenuItems = tripsService.tripItems

        view?.applyInitialSnapshots(menuListData: rootMenuOptions,
                                    collapsedMenuListItem: .trips,
                                    collapsedMenuListData: tripsMenuItems.map { $0.name })

        // TODO: indexPath latest trips. Think about more beauty way of selection
        view?.selectItem(with: IndexPath(item: 1, section: 1))
        delegate?.didSelectMenuOption(.trips, selectedTrip: tripsMenuItems[safe: 0])
    }

    func selectMenuOptionAction(with indexPath: IndexPath) {
        if indexPath.section == 0, let selectedItem = rootMenuOptions[safe: indexPath.item] {
            delegate?.didSelectMenuOption(selectedItem, selectedTrip: nil)
        } else if indexPath.section == 1, let selectedTrip = tripsMenuItems[safe: indexPath.item - 1] {
            delegate?.didSelectMenuOption(.trips, selectedTrip: selectedTrip)
        }
    }
}

//
//  SideBarViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/14/20.
//

import UIKit

protocol SideBarViewControllable: ViewControllable {
    var presenter: SideBarPresenterInteractable? { get set }

    func applyInitialSnapshots(data: [(menuItem: RootMenuItem, childOptions: [String])])
}

protocol SideBarViewRoutable: ViewRoutable {

}

final class SideBarViewController: ViewController {
    var presenter: SideBarPresenterInteractable?

    enum Section: Int, Hashable, CaseIterable, CustomStringConvertible {
        case menuList, collapsedMenuItemList

        var description: String {
            switch self {
            case .menuList:
                return "MenuList"
            case .collapsedMenuItemList:
                return "CollapsedMenuItemList"
            }
        }
    }

    @IBOutlet private weak var collectionView: UICollectionView!
    private var dataSource: UICollectionViewDiffableDataSource<Section, SideBarItemViewModel>?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        configureDataSource()
        presenter?.viewDidLoad()
    }
}

extension SideBarViewController: SideBarViewControllable {
    func applyInitialSnapshots(data: [(menuItem: RootMenuItem, childOptions: [String])]) {
        let sections = Section.allCases
        var snapshot = NSDiffableDataSourceSnapshot<Section, SideBarItemViewModel>()
        snapshot.appendSections(sections)
        dataSource?.apply(snapshot, animatingDifferences: false)

        var menuListSnapshot = NSDiffableDataSourceSectionSnapshot<SideBarItemViewModel>()
        for dataItem in data {
            let rootMenuItemViewModel = RootMenuItemViewModel(tabBarItem: dataItem.menuItem)
            if dataItem.childOptions.isEmpty {
                let item = SideBarItemViewModel(title: rootMenuItemViewModel.title, image: rootMenuItemViewModel.image, hasChildOptions: false)
                menuListSnapshot.append([item])
            } else {
                var collapsedMenuItemListSnapshot = NSDiffableDataSourceSectionSnapshot<SideBarItemViewModel>()
                let rootItem = SideBarItemViewModel(title: rootMenuItemViewModel.title, image: rootMenuItemViewModel.image, hasChildOptions: true)
                collapsedMenuItemListSnapshot.append([rootItem])
                let childItems = dataItem.childOptions.map { SideBarItemViewModel(title: $0, hasChildOptions: false) }
                collapsedMenuItemListSnapshot.append(childItems, to: rootItem)
                dataSource?.apply(collapsedMenuItemListSnapshot, to: .collapsedMenuItemList)
            }
        }

        dataSource?.apply(menuListSnapshot, to: .menuList)
    }
}

extension SideBarViewController: SideBarViewRoutable {

}

extension SideBarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let _ = dataSource?.itemIdentifier(for: indexPath) else {
            collectionView.deselectItem(at: indexPath, animated: true)
            return
        }

        //TODO: handle tap on side bar option
    }
}

private extension SideBarViewController {
    func setupUI() {
        navigationItem.title = NSLocalizedString("Menu", comment: "")
        navigationItem.largeTitleDisplayMode = .always

        setupCollectionViewLayout()
        collectionView.delegate = self
    }

    func setupCollectionViewLayout() {
        let configuration = UICollectionLayoutListConfiguration(appearance: .sidebar)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, SideBarItemViewModel>(collectionView: collectionView) { (collectionView, indexPath, item)
            -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section")
            }

            switch section {
            case .menuList:
                return collectionView.dequeueConfiguredReusableCell(using: self.configuredMenuCell(), for: indexPath, item: item)
            case .collapsedMenuItemList:
                if item.hasChildOptions {
                    return collectionView.dequeueConfiguredReusableCell(using: self.configuredCollapsedItemHeader(), for: indexPath, item: item)
                } else {
                    return collectionView.dequeueConfiguredReusableCell(using: self.configuredCollapsedItemCell(), for: indexPath, item: item)
                }
            }
        }
    }

    func configuredMenuCell() -> UICollectionView.CellRegistration<UICollectionViewListCell, SideBarItemViewModel> {
        UICollectionView.CellRegistration<UICollectionViewListCell, SideBarItemViewModel> { cell, _, item in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            content.image = item.image
            cell.contentConfiguration = content
        }
    }

    func configuredCollapsedItemHeader() -> UICollectionView.CellRegistration<UICollectionViewListCell, SideBarItemViewModel> {
        UICollectionView.CellRegistration<UICollectionViewListCell, SideBarItemViewModel> { cell, _, item in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            content.image = item.image
            cell.contentConfiguration = content
            cell.accessories = [.outlineDisclosure(options: .init(style: .header))]
        }
    }

    func configuredCollapsedItemCell() -> UICollectionView.CellRegistration<UICollectionViewListCell, SideBarItemViewModel> {
        UICollectionView.CellRegistration<UICollectionViewListCell, SideBarItemViewModel> { cell, _, item in
            var content = cell.defaultContentConfiguration()
            content.text = item.title
            cell.contentConfiguration = content
        }
    }
}

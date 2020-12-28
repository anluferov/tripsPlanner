//
//  SideBarViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 12/14/20.
//

import UIKit

protocol SideBarViewControllable: ViewControllable {
    var presenter: SideBarPresenterInteractable? { get set }

    func applyInitialSnapshots(menuListData: [RootMenuItem], collapsedMenuListItem: RootMenuItem, collapsedMenuListData: [String])
    func selectItem(with indexPath: IndexPath)
}

protocol SideBarViewRoutable: ViewRoutable {

}

final class SideBarViewController: ViewController {
    var presenter: SideBarPresenterInteractable?

    enum Section: Int, Hashable, CaseIterable, CustomStringConvertible {
        case menuList, collapsedMenuList

        var description: String {
            switch self {
            case .menuList:
                return "MenuList"
            case .collapsedMenuList:
                return "CollapsedMenuList"
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
    func applyInitialSnapshots(menuListData: [RootMenuItem], collapsedMenuListItem: RootMenuItem, collapsedMenuListData: [String]) {
        let sections = Section.allCases
        var snapshot = NSDiffableDataSourceSnapshot<Section, SideBarItemViewModel>()
        snapshot.appendSections(sections)
        dataSource?.apply(snapshot, animatingDifferences: false)


        var menuListSnapshot = NSDiffableDataSourceSectionSnapshot<SideBarItemViewModel>()
        menuListSnapshot.append(menuListData
                                    .map { RootMenuItemViewModel(menuItem: $0) }
                                    .map { SideBarItemViewModel(title: $0.title, image: $0.image, hasChildOptions: false) })
        dataSource?.apply(menuListSnapshot, to: .menuList)

        var collapsedMenuItemListSnapshot = NSDiffableDataSourceSectionSnapshot<SideBarItemViewModel>()
        let rootMenuItemViewModel = RootMenuItemViewModel(menuItem: collapsedMenuListItem)
        let rootItem = SideBarItemViewModel(title: rootMenuItemViewModel.title, image: rootMenuItemViewModel.image, hasChildOptions: true)
        collapsedMenuItemListSnapshot.append([rootItem])
        let childItems = collapsedMenuListData.map { SideBarItemViewModel(title: $0, hasChildOptions: false) }
        collapsedMenuItemListSnapshot.append(childItems, to: rootItem)
        dataSource?.apply(collapsedMenuItemListSnapshot, to: .collapsedMenuList)
    }

    func selectItem(with indexPath: IndexPath) {
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
    }
}

extension SideBarViewController: SideBarViewRoutable {

}

extension SideBarViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.selectMenuOptionAction(with: indexPath)
    }
}

private extension SideBarViewController {
    func setupUI() {
        navigationItem.title = NSLocalizedString("Menu", comment: "")

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
            case .collapsedMenuList:
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

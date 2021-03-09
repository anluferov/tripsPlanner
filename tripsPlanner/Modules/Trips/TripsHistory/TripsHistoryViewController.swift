//
//  TripsViewController.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import UIKit

protocol TripsHistoryViewControllable: ViewControllable {
    var presenter: TripsHistoryPresenterInteractable? { get set }

    func update(viewModels: [TripCollectionViewCellViewModel])
}

protocol TripsHistoryViewRoutable: ViewRoutable {
    func presentTripLegend(_ viewController: ViewController)
    func presentTripCreationFlow(_ viewController: ViewController)
    func dismissTripCreationFlow()
}

final class TripsHistoryViewController: ViewController {
    struct Constants {
        static let reuseCellId = "tripCellIdentifier"
    }

    @IBOutlet private weak var tripsCollectionView: UICollectionView!
    @IBOutlet private weak var addTripButton: UIButton!

    var presenter: TripsHistoryPresenterInteractable?

    private var tripsViewModels: [TripCollectionViewCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }

    @IBAction private func tapCreateTripButtonAction(_ sender: Any) {
        presenter?.createTripAction()
    }
}

extension TripsHistoryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tripsViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = tripsCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseCellId, for: indexPath) as? TripCollectionViewCell,
              let cellViewModel = tripsViewModels[safe: indexPath.row] else {
            return UICollectionViewCell()
        }

        cell.update(description: cellViewModel.name)
        return cell
    }
}

extension TripsHistoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.openTripAction(with: indexPath.row)
    }
}

extension TripsHistoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 200.0)
    }
}

extension TripsHistoryViewController: TripsHistoryViewControllable {
    func update(viewModels: [TripCollectionViewCellViewModel]) {
        tripsViewModels = viewModels
    }
}

extension TripsHistoryViewController: TripsHistoryViewRoutable {
    func presentTripLegend(_ viewController: ViewController) {
        present(viewController, animated: true)
    }

    func presentTripCreationFlow(_ viewController: ViewController) {
        present(viewController, animated: true)
    }

    func dismissTripCreationFlow() {
        tripsCollectionView.reloadData()
        dismiss(animated: true)
    }
}

private extension TripsHistoryViewController {
    func setupUI() {
        addTripButton.backgroundColor = .blue

        view.backgroundColor = .white
        tripsCollectionView.backgroundColor = .white

        tripsCollectionView.dataSource = self
        tripsCollectionView.delegate = self

        addTripButton.layer.cornerRadius = 20.0
        addTripButton.backgroundColor = R.color.ultimateGray()
        addTripButton.applyDefaultShadow()
    }
}

extension UIView {
    func applyDefaultShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowRadius = 16.0
    }
}

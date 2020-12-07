//
//  Presenter.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

protocol PresenterInteractable: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewDidDisappear()
    func didReceiveMemoryWarning()
}

extension PresenterInteractable {
    func viewDidLoad() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewDidDisappear() {}
    func didReceiveMemoryWarning() {}
}

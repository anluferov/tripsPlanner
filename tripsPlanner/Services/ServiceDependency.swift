//
//  ServiceDependency.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 3/9/21.
//

import Foundation

@propertyWrapper
struct ServiceDependency<T> {
    var wrappedValue: T

    init() {
        self.wrappedValue = ServiceContainer.resolve()
    }
}

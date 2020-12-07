//
//  Array+Extension.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return self.indices ~= index ? self[index] : nil
    }
}

//
//  ToDoModel.swift
//  tripsPlanner
//
//  Created by Andrey Luferau on 11/28/20.
//

import Foundation

struct ToDoModel {
    let title: String
    let subtitle: String
    let items: [ToDoItemModel]
}

struct ToDoItemModel {
    let description: String
    let state: ToDoItemState
}

enum ToDoItemState {
    case active
    case inProgress
    case done
}

//
//  SelectionManager.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 30.11.2023.
//

import Foundation

struct SelectionManager {
    var selections = Set<UUID>()
    mutating func toggle(_ value: UUID) {
        if selections.contains(value) {
            selections.removeAll()
        } else {
            selections.removeAll()
            selections.insert(value)
        }
    }
}

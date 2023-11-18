//
//  Subscription.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 10.11.2023.
//

import Foundation
import SwiftData

@Model
class Subscription {
    var name: String
    var desc: String
    var icon: String
    var color: String
    var cost: String
    
    var notificationId: String

    init(name: String, desc: String, icon: String, color: String, cost: String, notificationId: String) {
        self.name = name
        self.desc = desc
        self.icon = icon
        self.color = color
        self.cost = cost
        self.notificationId = notificationId
    }
}

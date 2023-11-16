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
    
    init(name: String, desc: String, icon: String, color: String) {
        self.name = name
        self.desc = desc
        self.icon = icon
        self.color = color
    }
}

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
    var cost: String
    var currencySymbol: String
    var desc: String
    var icon: String
    var color: String
    var notes: String
    
    var firstBillDate: Date
    
    var selectedCycle: String
    var selectedCyclePeriod: Int
    var selectedCycleDate: String
    
    var selectedDay: String
    var selectedDate: Int
    var selectedTime: String
    
    var notificationId: String
    
    init(name: String, cost: String, currencySymbol: String, desc: String, icon: String, color: String, notes: String, firstBillDate: Date, selectedCycle: String, selectedCyclePeriod: Int, selectedCycleDate: String, selectedDay: String, selectedDate: Int, selectedTime: String, notificationId: String) {
        self.name = name
        self.cost = cost
        self.currencySymbol = currencySymbol
        self.desc = desc
        self.icon = icon
        self.color = color
        self.notes = notes
        self.firstBillDate = firstBillDate
        self.selectedCycle = selectedCycle
        self.selectedCyclePeriod = selectedCyclePeriod
        self.selectedCycleDate = selectedCycleDate
        self.selectedDay = selectedDay
        self.selectedDate = selectedDate
        self.selectedTime = selectedTime
        self.notificationId = notificationId
    }
}

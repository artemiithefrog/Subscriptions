//
//  SubscriptionViewModel.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 22.12.2023.
//

import Foundation

class SubscriptionViewModel: ObservableObject {
    
    @Published var showSheet = false
    @Published var showCycle = false
    @Published var showAlert = false
    @Published var showFirstBillDate = false
    
    func showPicker(showSheet: Bool, showCycle: Bool, showAlert: Bool, showFirstBillDate: Bool) {
        self.showSheet = showSheet
        self.showCycle = showCycle
        self.showAlert = showAlert
        self.showFirstBillDate = showFirstBillDate
    }
    
    func hideAllPickers() {
        self.showSheet = false
        self.showCycle = false
        self.showAlert = false
        self.showFirstBillDate = false
    }
}

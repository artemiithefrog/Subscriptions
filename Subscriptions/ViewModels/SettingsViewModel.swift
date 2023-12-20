//
//  SettingsViewModel.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 12.12.2023.
//

import Foundation
import SwiftUI

class SettingsViewModel: ObservableObject {
    
    @Published var selectedSorting = UserDefaults.standard.string(forKey: "APP_SORTING") ?? "Latest"
    @Published var selectedCurrencySymbol = UserDefaults.standard.string(forKey: "SELECTED_CURRENCYSYMBOL") ?? "$"
    @Published var selectedCurrency = UserDefaults.standard.string(forKey: "SELECTED_CURRENCY") ?? "🇺🇸 United States ($)"
    @AppStorage("APP_THEME") var appTheme = "System"
    
}

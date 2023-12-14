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
    @Published var selectedTheme = UserDefaults.standard.string(forKey: "APP_THEME") ?? "System"
    @AppStorage("isDarkMode") var appTheme = UserDefaults.standard.bool(forKey: "SELECTED_THEME")
    
}

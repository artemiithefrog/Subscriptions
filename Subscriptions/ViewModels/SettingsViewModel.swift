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
    @AppStorage("APP_THEME") var appTheme = "System"
    
}

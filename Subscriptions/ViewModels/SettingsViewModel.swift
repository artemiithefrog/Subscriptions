//
//  SettingsViewModel.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 12.12.2023.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published var selectedSorting = UserDefaults.standard.string(forKey: "APP_SORTING") ?? "Latest"
    
}

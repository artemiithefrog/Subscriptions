//
//  SubscriptionsApp.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 10.11.2023.
//

import SwiftUI

@main
struct SubscriptionsApp: App {
    
    @ObservedObject var settingsVM = SettingsViewModel()
    @AppStorage("isDarkMode") var isDarkMode = UserDefaults.standard.bool(forKey: "SELECTED_THEME") 
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(settingsVM.appTheme ? .dark : .light)
        }
        .modelContainer(for: [Subscription.self])
    }
}

//
//  SubscriptionsApp.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 10.11.2023.
//

import SwiftUI

@main
struct SubscriptionsApp: App {
    
    @StateObject var settingsVM = SettingsViewModel()
    
    var body: some Scene {
        WindowGroup {
            switch settingsVM.appTheme {
            case "System":
                ContentView()
                    .environmentObject(settingsVM)
            case "Light":
                ContentView()
                    .preferredColorScheme(.light)
                    .environmentObject(settingsVM)
            case "Dark":
                ContentView()
                    .preferredColorScheme(.dark)
                    .environmentObject(settingsVM)
            default:
                ContentView()
                    .environmentObject(settingsVM)
            }
        }
        .modelContainer(for: [Subscription.self])
    }
}

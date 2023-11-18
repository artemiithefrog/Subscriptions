//
//  SubscriptionsApp.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 10.11.2023.
//

import SwiftUI

@main
struct SubscriptionsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
        .modelContainer(for: [Subscription.self])
    }
}

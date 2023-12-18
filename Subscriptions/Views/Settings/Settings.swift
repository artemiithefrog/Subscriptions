//
//  Settings.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 12.11.2023.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var settingsVM: SettingsViewModel
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        
                    } label: {
                        Text("Subscription Premium")
                    }
                }
                Section {
                    NavigationLink {
                        ViewTotalAs()
                    } label: {
                        Text("View Total As")
                    }
                    NavigationLink {
                        AppTheme()
                            .environmentObject(settingsVM)
                    } label: {
                        Text("App Theme")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("Default Currency")
                    }
                    NavigationLink {
                       Sorting()
                            .environmentObject(settingsVM)
                    } label: {
                        Text("Sorting")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("App Icon")
                    }
                    NavigationLink {
                        
                    } label: {
                        Text("Font")
                    }
                }
                Section {
                    NavigationLink {
                        iCloudSync()
                    } label: {
                        Text("iCloud Sync")
                    }
                }
                Section {
                    NavigationLink {
                        Privacy()
                    } label: {
                        Text("Privacy")
                    }
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .tint(Color("ButtonTextGreen"))
                }
                ToolbarItem(placement: .principal) {
                    Text("Settings")
                        .bold()
                        .font(.system(size: 20))
                }
            }
            
        }
    }
}

#Preview {
    Settings()
}

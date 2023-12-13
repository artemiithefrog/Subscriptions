//
//  AppTheme.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 26.11.2023.
//

import SwiftUI

struct AppTheme: View {
    
    let items = ["System", "Light", "Dark"]
    @State private var selectedItem = "System"
    
    @EnvironmentObject var settingsVM: SettingsViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { item in
                    HStack {
                        if item == selectedItem {
                            HStack {
                                Text(item)
                                Spacer()
                                Image(systemName: "checkmark")
                            }
                        } else {
                            Text(item)
                        }
                    }
                    .onTapGesture {
                        selectedItem = item
                        UserDefaults.standard.setValue(selectedItem, forKey: "APP_THEME")
                        settingsVM.selectedTheme = selectedItem
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .tint(Color("ButtonTextGreen"))
                }
                ToolbarItem(placement: .principal) {
                    Text("Sorting")
                        .bold()
                        .font(.system(size: 20))
                }
            }
            .onAppear {
                selectedItem = settingsVM.selectedTheme
            }
        }
    }
}

#Preview {
    AppTheme()
}

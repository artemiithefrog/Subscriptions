//
//  Sorting.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 26.11.2023.
//

import SwiftUI

struct Sorting: View {
    
    let items = ["Latest", "Alphabetical (A - Z)", "Alphabetical (Z - A)", "Price (High - Low)", "Price (Low - High)"]
    @State private var selectedItem = "Latest"
    
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
                    }
                }
                Text("")
                Text("selected item: \(selectedItem)")
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        UserDefaults.standard.setValue(selectedItem, forKey: "APP_SORTING")
                        settingsVM.selectedSorting = selectedItem
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                }
            }
            .onAppear {
                selectedItem = settingsVM.selectedSorting
            }
            .onChange(of: settingsVM.selectedSorting) {
                print("view model changed  \(settingsVM.selectedSorting)")
            }
        }
    }
}

#Preview {
    Sorting()
}

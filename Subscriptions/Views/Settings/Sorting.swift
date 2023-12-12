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
                        UserDefaults.standard.setValue(selectedItem, forKey: "APP_SORTING")
                        settingsVM.selectedSorting = selectedItem
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
                selectedItem = settingsVM.selectedSorting
            }
        }
    }
}

#Preview {
    Sorting()
}

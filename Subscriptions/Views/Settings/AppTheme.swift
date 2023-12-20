//
//  AppTheme.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 20.12.2023.
//

import SwiftUI

struct AppTheme: View {
    
    let items = ["System", "Light", "Dark"]
    @State private var selectedItem = "System"
    
    @ObservedObject var settingsVM = SettingsViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { item in
                        if item == selectedItem {
                            HStack {
                                Text(item)
                                Spacer()
                                Image(systemName: "checkmark")
                            }
                        } else {
                            HStack {
                                Text(item)
                                Spacer()
                            }
                            .onTapGesture {
                                selectedItem = item
                                settingsVM.appTheme = selectedItem
                            }
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
                    Text("App Theme")
                        .bold()
                        .font(.system(size: 20))
                }
            }
            .onAppear {
                selectedItem = settingsVM.appTheme
            }
        }
    }
}

#Preview {
    AppTheme()
}

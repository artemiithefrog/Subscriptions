//
//  Settings.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 12.11.2023.
//

import SwiftUI

struct Settings: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView  {
                
            }
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
                }
            }

        }
    }
}

#Preview {
    Settings()
}

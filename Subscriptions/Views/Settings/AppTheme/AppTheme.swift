//
//  AppTheme.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 26.11.2023.
//

import SwiftUI

struct AppTheme: View {
    
    private var themes = Themes.dummyData()
    @State private var selectionManager = SelectionManager()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List(themes) { themes in
                SelectedTheme(themes: themes, selectionManager: $selectionManager)
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
    }
}

#Preview {
    AppTheme()
}

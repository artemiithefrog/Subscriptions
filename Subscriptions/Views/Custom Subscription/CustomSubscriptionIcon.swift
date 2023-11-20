//
//  CustomSubscriptionIcon.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 20.11.2023.
//

import SwiftUI

struct CustomSubscriptionIcon: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                }
                .tint(Color("ButtonTextGreen"))
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CustomSubscriptionIcon()
}

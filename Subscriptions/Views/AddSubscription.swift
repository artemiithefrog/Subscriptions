//
//  AddSubscription.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 10.11.2023.
//

import SwiftUI

struct AddSubscription: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Text("Amazon AWS")
                    Spacer()
                    Image(systemName: "plus")
                }
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.red, lineWidth: 1)
                }
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                      dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                    }
                    .tint(.gray)
                }
//                ToolbarItem(placement: .principal) {
//                    Text("Add Subscription")
//                        .bold()
//                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Text("Create Custom Subscription")
                            .bold()
                            .foregroundColor(Color("ButtonTextGreen"))
                    }
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddSubscription()
}

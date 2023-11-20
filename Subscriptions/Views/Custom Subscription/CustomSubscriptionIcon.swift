//
//  CustomSubscriptionIcon.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 20.11.2023.
//

import SwiftUI

struct CustomSubscriptionIcon: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var selectedIcon: SelectedIcon
    let icons = ["envelope", "heart", "home", "marker-2", "marker", "phone-call", "play", "settings", "user"]
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(icons, id: \.self) { icon in
                        Image(icon)
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(25)
                            .overlay {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.gray, lineWidth: 1)
                                    .opacity(0.5)
                            }
                            .onTapGesture {
                                selectedIcon.selectedIcon = icon
                                print(icon)
                                dismiss()
                            }
                    }
                }
                .padding(.horizontal)
            }
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

class SelectedIcon: ObservableObject {
    @Published var selectedIcon = "marker"
}

#Preview {
    CustomSubscriptionIcon()
}

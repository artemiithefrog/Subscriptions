//
//  Privacy.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 26.11.2023.
//

import SwiftUI

struct Privacy: View {
    
    @State private var isFaceIDOn = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section("App Security") {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Face ID")
                                .bold()
                            Text("Require Face ID to unlock the app")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        Toggle("", isOn: $isFaceIDOn)
                            .frame(width: 30)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
        }
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
                Text("Privacy")
                    .bold()
                    .font(.system(size: 20))
            }
        }
    }
}

#Preview {
    Privacy()
}

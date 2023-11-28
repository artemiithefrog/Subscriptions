//
//  iCloudSync.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 26.11.2023.
//

import SwiftUI

struct iCloudSync: View {
    
    @State private var isICloudSyncOn = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                Section("iCloud Sync") {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Enable iCloud Sync")
                                .bold()
                        }
                        Spacer()
                        Toggle("", isOn: $isICloudSyncOn)
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
                Text("iCloud Sync")
                    .bold()
                    .font(.system(size: 20))
            }
        }
    }
}

#Preview {
    iCloudSync()
}

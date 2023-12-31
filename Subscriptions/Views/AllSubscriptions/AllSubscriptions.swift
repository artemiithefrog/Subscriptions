//
//  AllSubscriptions.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 10.11.2023.
//

import SwiftUI
import SwiftData

struct AllSubscriptions: View {
    
    @Query private var subscriptions: [Subscription]
    @State private var showAddSubscriptionView = false
    @State private var showSettingsView = false
    
    @ObservedObject private var settingsVM = SettingsViewModel()
    
    var body: some View {
        NavigationStack {
            HStack {
                Button {
                    showSettingsView = true
                } label: {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .tint(.gray)
                
                Spacer()
                
                Text("All Subscriptions")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                
                Spacer()
                
                Button {
                    showAddSubscriptionView = true
                } label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .fontWeight(.medium)
                }
                .tint(.gray)
            }
            .padding()
            
            if subscriptions.isEmpty {
                VStack {
                    Spacer()
                    Text("No Subscriptions Found")
                        .bold()
                    Text("Add your first subscription to see it here")
                        .foregroundColor(.gray)
                        .fontWeight(.light)
                    
                    Button {
                        showAddSubscriptionView = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 180, height: 50)
                                .foregroundColor(Color("ButtonGray"))
                                .opacity(0.25)
                                .padding(EdgeInsets(top: 0, leading: 100, bottom: 0, trailing: 100))
                            Text("Add Subscription")
                                .bold()
                                .foregroundColor(Color("ButtonTextGreen"))
                        }
                    }
                    Spacer()
                }
            } else {
                Subscriptions(sort: settingsVM.selectedSorting)
            }
        }
        .sheet(isPresented: $showAddSubscriptionView) {
            AddSubscription()
        }
        .sheet(isPresented: $showSettingsView) {
            Settings()
                .environmentObject(settingsVM)
        }
    }
}

#Preview {
    AllSubscriptions()
}

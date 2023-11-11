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
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "gear")
                }
                .tint(.gray)
                
                Spacer()
                
                Text("All Subscriptions")
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "plus")
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
                ScrollView {
                }
            }
        }
        .sheet(isPresented: $showAddSubscriptionView) {
            AddSubscription()
        }
    }
}

#Preview {
    AllSubscriptions()
}

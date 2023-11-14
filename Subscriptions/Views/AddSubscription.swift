//
//  AddSubscription.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 10.11.2023.
//

import SwiftUI

struct AddSubscription: View {
    
    @Environment(\.dismiss) private var dismiss
    private var services = ServicesViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(services.servises) { service in
                    NavigationLink {
                        NewSubscription(service: service)
                    } label: {
                        HStack {
                            Image(service.icon)
                                .resizable()
                                .frame(width: 35, height: 35)
                                .foregroundColor(service.color)
                            Text(service.name)
                                .bold()
                                .foregroundColor(service.color)
                            Spacer()
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .foregroundColor(service.color)
                        }
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(service.color), lineWidth: 1)
                        }
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                    }
                }
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
                ToolbarItem(placement: .principal) {
                    Text("Add Subscription")
                        .bold()
                        .font(.system(size: 20))
                }
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        Text("Create Custom Subscription")
                            .bold()
                            .foregroundColor(Color("ButtonTextGreen"))
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AddSubscription()
}

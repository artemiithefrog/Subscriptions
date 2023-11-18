//
//  EditSubscription.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 16.11.2023.
//

import SwiftUI

struct EditSubscription: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    let susbcription: Subscription
    
    @State var name: String = ""
    @State private var cost: String = ""
    @State private var description: String = ""
    @State private var notes: String = ""
    
    @State private var isSaveButtonDisabled = true
    
    @FocusState private var costIsFocused: Bool
    @FocusState private var nameIsFocused: Bool
    @FocusState private var descriptionIsFocused: Bool
    @FocusState private var notesIsFocused :Bool
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Name")
                        Spacer()
                        TextField("Name", text: $name)
                            .multilineTextAlignment(.trailing)
                            .tint(Color("ButtonTextGreen"))
                            .focused($nameIsFocused)
                    }
                    HStack {
                        Text("Cost")
                        Spacer()
                        TextField("Cost", text: $cost)
                            .multilineTextAlignment(.trailing)
                            .tint(Color("ButtonTextGreen"))
                            .keyboardType(.numberPad)
                            .focused($costIsFocused)
                            .onChange(of: cost) {
                                if cost.isEmpty {
                                    isSaveButtonDisabled = true
                                } else {
                                    isSaveButtonDisabled = false
                                }
                            }
                    }
                    HStack {
                        Text("Description")
                        Spacer()
                        TextField("Description", text: $description)
                            .multilineTextAlignment(.trailing)
                            .tint(Color("ButtonTextGreen"))
                            .focused($descriptionIsFocused)
                    }
                } header: {
                    HStack {
                        Spacer()
                        VStack {
                            Image(susbcription.icon)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color(susbcription.color))
                            Text(susbcription.name)
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                                .bold()
                        }
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    
                }
                
                Section {
                    HStack {
                        Text("Color")
                        Spacer()
                    }
                    HStack {
                        Text("First Bill Date")
                        Spacer()
                    }
                    HStack {
                        Text("Cycle")
                        Spacer()
                    }
                    HStack {
                        Text("Alert")
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text("Notes")
                            .padding(.bottom, -10)
                        Spacer()
                        TextField("Enter Notes", text: $notes)
                            .tint(Color("ButtonTextGreen"))
                            .focused($notesIsFocused)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
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
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    if cost.isEmpty {
                        
                    } else {
                        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
//                        let subscription = Subscription(name: name, desc: description, icon: susbcription.icon, color: susbcription.color, notificationId: String)
//                        context.insert(subscription)
                        cost = ""
                        description = ""
                        notes = ""
                    }
                } label: {
                    Text("Save")
                }
                .disabled(isSaveButtonDisabled)
                .tint(isSaveButtonDisabled ? .gray : Color("ButtonTextGreen"))
            }
            ToolbarItem(placement: .keyboard) {
                HStack {
                    Spacer()
                    Button {
                        nameIsFocused = false
                        costIsFocused = false
                        descriptionIsFocused = false
                        notesIsFocused = false
                    } label: {
                        Text("Done")
                    }
                    .tint(.black)
                    .opacity(0.7)
                }
                .padding(.trailing, 10)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    EditSubscription(susbcription: Subscription(name: "YouTube Premium", desc: "description", icon: "youtube", color: "#F61D0D", cost: "10", notificationId: ""))
}

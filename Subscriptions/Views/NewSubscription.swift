//
//  NewSubscription.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 13.11.2023.
//

import SwiftUI

struct NewSubscription: View {
    
    @Environment(\.dismiss) private var dismiss
    let service: Service
    
    @State private var text: String = "Youtube Premium"
    @State private var cost: String = ""
    @State private var description: String = ""
    @State private var notes: String = ""
    
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
                        TextField("Name", text: $text)
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
                            Image(service.icon)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color(service.color))
                            Text(service.name)
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
                    
                } label: {
                    Text("Add")
                }
                .tint(Color("ButtonTextGreen"))
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
    NewSubscription(service: Service(icon: "youtube", color: Color(hex: "F61D0D"), name: "Youtube Premium"))
}

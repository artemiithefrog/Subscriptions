//
//  NewSubscription.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 13.11.2023.
//

import SwiftUI
import SwiftData

struct NewSubscription: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    let service: Service
    let notificationHandler = NotificationHandler()
    
    @State var name: String
    @State private var cost: String = ""
    @State private var description: String = ""
    @State private var notes: String = ""
    
    @State private var firstBillDate = Date()
    @State private var cycle = "Monthly"
    @State private var alert = "None"
    
    @State private var selectedCycle = "Every"
    @State private var selectedCyclePeriod = 1
    @State private var selectedCycleDate = "Month(s)"
    
    @State private var selectedDay = ""
    @State private var selectedDate = 31
    @State private var selectedTime = ""
    
    @State private var showSheet = false
    @State private var showCycle = false
    @State private var showAlert = false
    
    @State private var notificationId = ""
    @State private var isAddButtonDisabled = true
    
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
                                    isAddButtonDisabled = true
                                } else {
                                    isAddButtonDisabled = false
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
                        DatePicker("", selection: $firstBillDate, displayedComponents: .date)
                            .tint(.green)
                    }
                    
                    HStack {
                        Text("Cycle")
                        Spacer()
                        Text("Every \(selectedCyclePeriod) \(selectedCycleDate)")
                            .bold()
                    }
                    .onTapGesture {
                        withAnimation {
                            showSheet = true
                            showCycle = true
                        }
                    }
                    
                    HStack {
                        Text("Alert")
                        Spacer()
                        if selectedDate == 31 {
                            Text("Never")
                                .fontWeight(.bold)
                        } else if selectedDate == 32 {
                            Text("Same day")
                                .fontWeight(.bold)
                        } else {
                            Text("\(selectedDate) \(selectedDay) \(selectedTime)")
                                .fontWeight(.bold)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            showSheet = true
                            showAlert = true
                        }
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
            
            if showSheet {
                VStack {
                    HStack {
                        Spacer()
                        Button {
                            withAnimation {
                                showSheet = false
                                showCycle = false
                                showAlert = false
                            }
                        } label: {
                            Text("Done")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                        }
                    }
                    .padding()
                    if showCycle {
                        CyclePicker(selectedCycle: $selectedCycle, selectedCyclePeriod: $selectedCyclePeriod, selectedCycleDate: $selectedCycleDate)
                    } else {
                        AlertPicker(selectedDate: $selectedDate, selectedDay: $selectedDay, selectedTime: $selectedTime)
                    }
                }
                .frame(height: UIScreen.main.bounds.height / 3)
                .transition(.move(edge: .bottom))
            }

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
                        notificationHandler.askPermission()
                        notificationId = notificationHandler.createNotification(every: selectedCyclePeriod,
                                                                                             date: selectedCycleDate,
                                                                                             from: firstBillDate,
                                                                                             nextNotificationDay: selectedDay,
                                                                                             nextNotificationInterval: selectedDate,
                                                                                             repeats: true,
                                                                                             title: "\(name)'s bill",
                                                                                             body: "This is notification from subscription manager, you'll pay \(cost)")
                        let subscription = Subscription(name: name, desc: description, icon: service.icon, color: service.color.toHexString(), cost: cost, notificationId: notificationId)
                        context.insert(subscription)
                        cost = ""
                        description = ""
                        notes = ""
                        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
                    }
                } label: {
                    Text("Add")
                }
                .disabled(isAddButtonDisabled)
                .tint(isAddButtonDisabled ? .gray : Color("ButtonTextGreen"))
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
    NewSubscription(service: Service(icon: "youtube", color: Color(hex: "F61D0D"), name: "Youtube Premium"), name: "Youtube Premium")
}

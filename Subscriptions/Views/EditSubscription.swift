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
    let notificationHandler = NotificationHandler()
    let selectedSubscription: Subscription
    
    @StateObject var selectedIcon = SelectedIcon()
    @StateObject var subscriptionVM = SubscriptionViewModel()
    @ObservedObject var settingsVM = SettingsViewModel()
    
    @State var name: String
    @State var cost: String
    @State var description: String
    @State var notes: String
    @State var color: Color
    @State var icon: String
    
    @State var firstBillDate: Date
    
    @State var selectedCycle: String
    @State var selectedCyclePeriod: Int
    @State var selectedCycleDate: String
    
    @State var selectedDay: String
    @State var selectedDate: Int
    @State var selectedTime: String
    
    @State private var showSheet = false
    @State private var showCycle = false
    @State private var showAlert = false
    @State private var showFirstBillDate = false
    @State private var costIsEmpty = false
    
    @State private var notificationId = ""
    
    @FocusState private var costIsFocused: Bool
    @FocusState private var nameIsFocused: Bool
    @FocusState private var descriptionIsFocused: Bool
    @FocusState private var notesIsFocused: Bool

    
    var body: some View {
        
        NavigationStack {
            List {
                Section {
                    HStack {
                        Text("Name")
                            .bold(nameIsFocused ? true : false)
                        Spacer()
                        TextField("Name", text: $name)
                            .multilineTextAlignment(.trailing)
                            .tint(Color("ButtonTextGreen"))
                            .focused($nameIsFocused)
                            .onTapGesture {
                                subscriptionVM.hideAllPickers()
                            }
                            .opacity(nameIsFocused ? 1 : 0.4)
                    }
                    HStack {
                        Text("Cost")
                            .bold(costIsFocused ? true : false)
                        Spacer()
                        TextField("Cost", text: $cost)
                            .multilineTextAlignment(.trailing)
                            .tint(Color("ButtonTextGreen"))
                            .keyboardType(.decimalPad)
                            .focused($costIsFocused)
                            .onChange(of: cost) {
                                if cost.isEmpty {
                                    costIsEmpty = true
                                } else {
                                    costIsEmpty = false
                                }
                            }
                            .onTapGesture {
                                subscriptionVM.hideAllPickers()
                            }
                            .opacity(costIsFocused ? 1 : 0.4)
                    }
                    HStack {
                        Text("Description")
                            .bold(descriptionIsFocused ? true : false)
                        Spacer()
                        TextField("Description", text: $description)
                            .multilineTextAlignment(.trailing)
                            .tint(Color("ButtonTextGreen"))
                            .focused($descriptionIsFocused)
                            .onTapGesture {
                                subscriptionVM.hideAllPickers()
                            }
                            .opacity(descriptionIsFocused ? 1 : 0.4)
                    }
                } header: {
                    HStack {
                        Spacer()
                        VStack {
                            Image(icon)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(color)
                            Text(name)
                                .foregroundColor(.black)
                                .font(.system(size: 18))
                                .bold()
                        }
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    
                }
                
                Section {
                    NavigationLink {
                        CustomSubscriptionIcon()
                            .environmentObject(selectedIcon)
                    } label: {
                        HStack {
                            Text("Icon")
                            Spacer()
                            Image(icon)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(color)
                        }
                    }
                    .onChange(of: selectedIcon.selectedIcon) {
                        icon = selectedIcon.selectedIcon
                    }
                    .onAppear {
                        selectedIcon.selectedIcon = icon
                    }
                    HStack {
                        Text("Color")
                        Spacer()
                        ColorPicker("", selection: $color)
                    }
                    HStack {
                        Text("First Bill Date")
                            .bold(showFirstBillDate ? true : false)
                        Spacer()
                        Text("\(firstBillDate.formatted(date: .long, time: .omitted))")
                            .opacity(showFirstBillDate ? 1 : 0.4)
                    }
                    .onTapGesture {
                        withAnimation {
                            showSheet = true
                            showFirstBillDate = true
                            showCycle = false
                            showAlert = false
                            costIsFocused = false
                            nameIsFocused = false
                            descriptionIsFocused = false
                            notesIsFocused = false
                        }
                    }
                    
                    HStack {
                        Text("Cycle")
                            .bold(showCycle ? true : false)
                        Spacer()
                        Text("Every \(selectedCyclePeriod) \(selectedCycleDate)")
                            .opacity(showCycle ? 1 : 0.4)
                    }
                    .onTapGesture {
                        withAnimation {
                            showSheet = true
                            showCycle = true
                            showAlert = false
                            showFirstBillDate = false
                            costIsFocused = false
                            nameIsFocused = false
                            descriptionIsFocused = false
                            notesIsFocused = false
                        }
                    }
                    
                    HStack {
                        Text("Alert")
                            .bold(showAlert ? true : false)
                        Spacer()
                        if selectedDate == 31 {
                            Text("Never")
                                .opacity(showAlert ? 1 : 0.4)
                        } else if selectedDate == 32 {
                            Text("Same day")
                                .opacity(showAlert ? 1 : 0.4)
                        } else {
                            Text("\(selectedDate) \(selectedDay) \(selectedTime)")
                                .opacity(showAlert ? 1 : 0.4)
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            showSheet = true
                            showAlert = true
                            showCycle = false
                            showFirstBillDate = false
                            costIsFocused = false
                            nameIsFocused = false
                            descriptionIsFocused = false
                            notesIsFocused = false
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Notes")
                            .padding(.bottom, -10)
                            .bold(notesIsFocused ? true : false)
                        Spacer()
                        TextField("Enter Notes", text: $notes)
                            .tint(Color("ButtonTextGreen"))
                            .focused($notesIsFocused)
                            .onTapGesture {
                                showSheet = false
                            }
                            .opacity(notesIsFocused ? 1 : 0.4)
                    }
                }
                Section {
                    Button {
                        dismiss()
                        context.delete(selectedSubscription)
                        notificationHandler.deleteNotification(id: notificationId)
                        print("Subscription deleted \(selectedSubscription)")
                    } label: {
                        Text("delete subscription")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
        .sheet(isPresented: $showSheet) {
            VStack {
                HStack {
                    Spacer()
                    Button {
                        withAnimation {
                            subscriptionVM.hideAllPickers()
                        }
                    } label: {
                        Text("Done")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                    }
                }
                .padding()
                
                if showFirstBillDate {
                    DatePicker("", selection: $firstBillDate, displayedComponents: .date)
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                } else if showCycle {
                    CyclePicker(selectedCycle: $selectedCycle, selectedCyclePeriod: $selectedCyclePeriod, selectedCycleDate: $selectedCycleDate)
                } else {
                    AlertPicker(selectedDate: $selectedDate, selectedDay: $selectedDay, selectedTime: $selectedTime)
                }
            }
            .presentationDetents([.height(UIScreen.main.bounds.height / 3)])
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
                        notificationHandler.deleteNotification(id: notificationId)
                        notificationId = notificationHandler.createNotification(every: selectedCyclePeriod,
                                                                                date: selectedCycleDate,
                                                                                from: firstBillDate,
                                                                                nextNotificationDay: selectedDay,
                                                                                nextNotificationInterval: selectedDate,
                                                                                repeats: true,
                                                                                title: "\(name)'s bill",
                                                                                body: "\(name) id due soon for $\(cost)")
                        
                        let subscription = Subscription(name: name,
                                                        cost: cost,
                                                        currencySymbol: settingsVM.selectedCurrencySymbol,
                                                        desc: description,
                                                        icon: selectedIcon.selectedIcon,
                                                        color: color.toHexString(),
                                                        notes: notes,
                                                        firstBillDate: firstBillDate, 
                                                        
                                                        selectedCycle: selectedCycle,
                                                        selectedCyclePeriod: selectedCyclePeriod,
                                                        selectedCycleDate: selectedCycleDate,
                                                        selectedDay: selectedDay,
                                                        selectedDate: selectedDate,
                                                        selectedTime: selectedTime,
                                                        notificationId: notificationId)
                        context.delete(selectedSubscription)
                        context.insert(subscription)
                        cost = ""
                        description = ""
                        notes = ""
                        dismiss()
                    }
                } label: {
                    Text("Save")
                }
                .disabled(costIsEmpty)
                .tint(costIsEmpty ? .gray : Color("ButtonTextGreen"))
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

//#Preview {
//    EditSubscription()
//}

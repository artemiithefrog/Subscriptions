//
//  Subscriptions.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 12.12.2023.
//

import SwiftUI
import SwiftData

struct Subscriptions: View {
    
    @Query private var subscriptions: [Subscription]
    
    var body: some View {
        List(subscriptions) { subscription in
            NavigationLink {
                EditSubscription(selectedSubscription: subscription,
                                 name: subscription.name,
                                 cost: subscription.cost,
                                 description: subscription.desc,
                                 notes: subscription.notes,
                                 color: Color(hex: subscription.color),
                                 icon: subscription.icon,
                                 firstBillDate: subscription.firstBillDate,
                                 selectedCycle: subscription.selectedCycle,
                                 selectedCyclePeriod: subscription.selectedCyclePeriod,
                                 selectedCycleDate: subscription.selectedCycleDate,
                                 selectedDay: subscription.selectedDay,
                                 selectedDate: subscription.selectedDate,
                                 selectedTime: subscription.selectedTime)
            } label: {
                HStack {
                    Image(subscription.icon)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color(hex: subscription.color))

                    VStack(alignment: .leading) {
                        if subscription.desc.isEmpty {
                            Text(subscription.name)
                        } else {
                            Text(subscription.name)
                            Text(subscription.desc)
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("$\(subscription.cost)")
                            .font(.callout)
                    }
                }
            }
        }
        
    }
    
    init(sort: String) {
        switch sort {
        case "Latest":
            _subscriptions = Query(sort: [SortDescriptor(\Subscription.name)])
        case "Alphabetical (A - Z)":
            _subscriptions = Query(sort: [SortDescriptor(\Subscription.name)])
        case "Alphabetical (Z - A)":
            _subscriptions = Query(sort: [SortDescriptor(\Subscription.name, order: .reverse)])
        case "Price (High - Low)":
            _subscriptions = Query(sort: [SortDescriptor(\Subscription.cost, order: .reverse)])
        case "Price (Low - High)":
            _subscriptions = Query(sort: [SortDescriptor(\Subscription.cost)])
        default:
            _subscriptions = Query(sort: [SortDescriptor(\Subscription.name)])
        }
    }
}

//
//  ViewTotalAs.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 26.11.2023.
//

import SwiftUI

struct ViewTotalAs: View {
    
    let items: [TotalModel] = [
        TotalModel(title: "Average Expenses", description: "Divides the total of all bills into the period of your choosing."),
        TotalModel(title: "Remaining Expenses", description: "Shows a total of the bills you have left to pay rhis period."),
        TotalModel(title: "Total Expenses", description: "Shows a total of the bills you have in this entire period."),
    ]
    @State private var selectedItem = "Average Expenses"
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(items, id: \.self) { item in
                    HStack {
                        if item.title == selectedItem {
                            HStack {
                                Image(systemName: "checkmark")
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                    Text(item.description)
                                        .font(.system(size: 15))
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                }
                            }
                        } else {
                            HStack {
                                Image(systemName: "checkmark")
                                    .opacity(0)
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                    Text(item.description)
                                        .font(.system(size: 15))
                                        .fontWeight(.light)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .onTapGesture {
                        selectedItem = item.title
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
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
                    Text("View Total as")
                        .bold()
                        .font(.system(size: 20))
                }
            }
        }
    }
}

struct TotalModel: Codable, Hashable {
    
    var title: String
    var description: String
    
}

#Preview {
    ViewTotalAs()
}

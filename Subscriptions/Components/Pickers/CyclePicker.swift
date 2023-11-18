//
//  CyclePicker.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 17.11.2023.
//

import SwiftUI

struct CyclePicker: View {
    
    @Binding var selectedCycle: String
    @Binding var selectedCyclePeriod: Int
    @Binding var selectedCycleDate: String
    
    var cycle: Array<String> = ["Every"]
    var cyclePeriod: Array<Int> = Array(1...30)
    var cycleDate: Array<String> = ["Day(s)", "Week(s)", "Month(s)", "Year(s)"]
    
    var body: some View {
        
        HStack(spacing: -15) {
            Picker("", selection: $selectedCycle) {
                ForEach(cycle, id: \.self) {cycle in
                    Text("\(cycle)")
                }
            }
            .pickerStyle(.wheel)
            Picker("", selection: $selectedCyclePeriod) {
                ForEach(cyclePeriod, id: \.self) {cycle in
                    Text("\(cycle)")
                }
            }
            .pickerStyle(.wheel)
            Picker("", selection: $selectedCycleDate) {
                ForEach(cycleDate, id: \.self) {cycle in
                    Text("\(cycle)")
                }
            }
            .pickerStyle(.wheel)
        }
    }
}

//
//  SelectedTheme.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 30.11.2023.
//

import SwiftUI

struct SelectedTheme: View {
    var themes: Themes
    
    @Binding var selectionManager: SelectionManager
    
    var isSelected: Bool {
        selectionManager.selections.contains(themes.id)
    }
    
    var body: some View {
        HStack {
            Text(self.themes.name)
            Spacer()
            if self.isSelected {
                Image(systemName: "checkmark")
                    .foregroundColor(Color.blue)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture{
            self.selectionManager.toggle(self.themes.id)
        }
    }
}

struct SelectionManager {
    var selections = Set<UUID>()
    mutating func toggle(_ value: UUID) {
        if selections.contains(value) {
            selections.removeAll()
        } else {
            selections.removeAll()
            selections.insert(value)
        }
    }
}

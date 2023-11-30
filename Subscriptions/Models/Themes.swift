//
//  Themes.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 30.11.2023.
//

import Foundation
import SwiftUI

struct Themes: Identifiable {
    var id = UUID()
    var name: String
}

extension Themes {
    static func dummyData() -> [Themes] {
        let items = ["System", "Light", "Dark"]
        
        var array = [Themes]()
        
        for item in items {
            let themes = Themes(name: item)
            array.append(themes)
        }
        return array
    }
}

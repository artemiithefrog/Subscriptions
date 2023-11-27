//
//  Privacy.swift
//  Subscriptions
//
//  Created by artemiithefrog . on 26.11.2023.
//

import SwiftUI

struct Privacy: View {
    
    @State private var isFaceIDOn = false
    
    var body: some View {
        List {
            Section("App Security") {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Face ID")
                            .bold()
                        Text("Require Face ID to unlock the app")
                            .font(.system(size: 15))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Toggle("", isOn: $isFaceIDOn)
                        .frame(width: 30)
                }
            }
            
        }
    }
}

#Preview {
    Privacy()
}

//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2024-11-23.
//  Copyright © 2024-2026 Daniel Saidi. All rights reserved.
//

import AppIconKit
import SwiftUI

struct ContentView: View {

    @StateObject
    var context = AlternateAppIconContext()

    var collections: [AlternateAppIconCollection] {
        [
            .init(name: "Standard", icons: [.init(name: "AppIcon", icon: Image(.appIconBlue), appIconName: nil)]),
            .init(name: "Collection 1", icons: [.blue, .green, .red, .yellow]),
            .init(name: "Collection 2", icons: [.green, .red, .yellow]),
            .init(name: "Collection 3", icons: [.red, .yellow]),
            .init(name: "Collection 4", icons: [.yellow])
        ]
    }

    var body: some View {
        NavigationStack {
            AlternateAppIconShelf(
                collections: collections,
                context: context,
                onIconSelected: { print("Selected \($0.name)") }
            )
            #if !os(tvOS)
            .scrollContentBackground(.hidden)
            #endif
            .background(Color.primary.opacity(0.05))
            .navigationTitle("AppIconKit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Reset") {
                        context.resetAlternateAppIcon()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2024-11-23.
//

import AppIconKit
import SwiftUI

extension AlternateAppIcon {

    static var blue: Self {
        .init(icon: .init(.appIconBlue), iconName: "AppIcon-Blue")
    }

    static var green: Self {
        .init(icon: .init(.appIconGreen), iconName: "AppIcon-Green")
    }

    static var red: Self {
        .init(icon: .init(.appIconRed), iconName: "AppIcon-Red")
    }

    static var yellow: Self {
        .init(icon: .init(.appIconYellow), iconName: "AppIcon-Yellow")
    }
}

struct ContentView: View {

    @StateObject
    var context = AlternateAppIconContext()

    var collections: [AlternateAppIconCollection] {
        [
            .init(name: "Collection 1", icons: [.blue, .green, .red, .yellow]),
            .init(name: "Collection 2", icons: [.green, .red, .yellow]),
            .init(name: "Collection 3", icons: [.red, .yellow]),
            .init(name: "Collection 4", icons: [.yellow]),
            .init(name: "Collection 5", icons: [.red, .yellow]),
            .init(name: "Collection 6", icons: [.green, .red, .yellow]),
            .init(name: "Collection 7", icons: [.blue, .green, .red, .yellow])
        ]
    }

    var body: some View {
        AlternateAppIconShelf(
            collections: collections,
            context: context,
            onIconSelected: { print("Selected \($0.iconName)") }
        )
    }
}

#Preview {
    ContentView()
}

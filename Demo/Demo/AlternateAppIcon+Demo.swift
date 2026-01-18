//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2024-11-23.
//  Copyright © 2024-2026 Daniel Saidi. All rights reserved.
//

import AppIconKit
import SwiftUI

extension AlternateAppIcon {

    static var blue: Self {
        .init(
            name: "Blue",
            icon: .init(.appIconBlue),
            appIconName: "AppIcon-Blue"
        )
    }

    static var green: Self {
        .init(
            name: "Green",
            icon: .init(.appIconGreen),
            appIconName: "AppIcon-Green"
        )
    }

    static var red: Self {
        .init(
            name: "Red",
            icon: .init(.appIconRed),
            appIconName: "AppIcon-Red"
        )
    }

    static var yellow: Self {
        .init(
            name: "Yellow",
            icon: .init(.appIconYellow),
            appIconName: "AppIcon-Yellow"
        )
    }
}

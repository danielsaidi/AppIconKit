//
//  AlternateAppIcon.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This model represents an alternate app icon, wich can be
/// set to both list and set alternate app icons.
///
/// The `icon` is the icon asset to display, while `iconName`
/// is the name of the icon to set when the icon is selected.
/// You can make set `iconName` to nil to reset the app icon.
public struct AlternateAppIcon {

    /// Create an alternate app icon value.
    ///
    /// - Parameters:
    ///   - icon: The icon asset to display.
    ///   - iconName: The name of the alternate icon, if any.
    public init(
        icon: Image,
        iconName: String?
    ) {
        self.icon = icon
        self.iconName = iconName
    }

    /// The icon asset to display.
    public let icon: Image

    /// The name of the alternate icon, if any.
    public let iconName: String?
}

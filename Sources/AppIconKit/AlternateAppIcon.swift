//
//  AlternateAppIcon.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This model represents an alternate app icon, wich can be
/// set to both list and set alternate app icons.
///
/// The `icon` is the icon asset to display, while `iconName`
/// is the name of the icon to set when the icon is selected.
/// You can make set `iconName` to nil to reset the app icon.
///
/// The type is also a namespace of related icon types, like
/// ``AlternateAppIcon/Item`` & ``AlternateAppIcon/ItemStyle``.
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

public extension AlternateAppIcon {

    /// An icon collection can group icons together.
    struct Collection {

        /// Create an alternate app icon value.
        ///
        /// - Parameters:
        ///   - name: The name of the section.
        ///   - icons: The icons in the section.
        public init(
            name: LocalizedStringKey,
            icons: [AlternateAppIcon]
        ) {
            self.name = name
            self.icons = icons
        }

        /// The name of the section.
        public let name: LocalizedStringKey

        /// The icons in the section.
        public let icons: [AlternateAppIcon]
    }
}

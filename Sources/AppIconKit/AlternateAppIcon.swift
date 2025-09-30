//
//  AlternateAppIcon.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This model represents an alternate app icon.
///
/// This model can be used to both list and set alternate app icons.
///
/// The ``icon`` parameter is the `.imageset` to show when displaying the
/// icon, while the ``appIconName`` refers to the `.appiconset` asset that
/// should be set when the icon is selected. A `nil` value should reset the icon.
public struct AlternateAppIcon: Identifiable {

    /// Create an alternate app icon value.
    ///
    /// - Parameters:
    ///   - icon: The icon asset to display.
    ///   - appIconName: The name of the `.appiconset` asset, if any.
    public init(
        icon: Image,
        appIconName: String?
    ) {
        self.icon = icon
        self.appIconName = appIconName
    }
    
    /// The unique icon ID.
    public var id: String { appIconName ?? "app" }

    /// The icon asset to display.
    public let icon: Image

    /// The name of the `.appiconset` asset, if any.
    public let appIconName: String?
}

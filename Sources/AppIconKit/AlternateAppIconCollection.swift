//
//  AlternateAppIconCollection.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This collection can be used to group alternate app icons
/// into related groups.
public struct AlternateAppIconCollection {
    
    /// Create an alternate app icon collection.
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
    
    /// Create an alternate app icon collection by mapping a
    /// set of icon names to ``AlternateAppIcon`` values.
    ///
    /// The `appIconName` should be the name of the main app
    /// icon `.appiconset` asset that is used by default.
    ///
    /// The `iconNames` array should be a list of plain icon
    /// names, while `iconNamePrefix` is an icon name prefix
    /// that will be added to the `.imageset` asset, and the
    /// `appIconNamePrefix` to the `.appiconset` asset.
    ///
    /// If the resulting icon name equals `appIconName`, the
    /// icon will reset the alternate app icon when selected.
    ///
    /// - Parameters:
    ///   - name: The name of the section.
    ///   - appIconName: The default app icon name.
    ///   - iconNames: A list of icon names.
    ///   - imageNamePrefix: A prefix to add to the `.imageset` asset name.
    ///   - appIconNamePrefix: A prefix to add to the `.appiconset` asset name.
    public init(
        name: LocalizedStringKey,
        appIconName: String,
        iconNames: [String],
        imageNamePrefix: String = "",
        appIconNamePrefix: String = ""
    ) {
        self.init(
            name: name,
            icons: iconNames.map {
                let name = $0.replacingOccurrences(of: " ", with: "")
                let imageName = "\(imageNamePrefix)\(name)"
                let isDefaultIcon = imageName == appIconName
                let appIconName = isDefaultIcon ? nil : "\(appIconNamePrefix)\(name)"
                return .init(
                    icon: Image(imageName),
                    appIconName: appIconName
                )
            }
        )
    }

    /// The name of the section.
    public let name: LocalizedStringKey

    /// The icons in the section.
    public let icons: [AlternateAppIcon]
}

//
//  AlternateAppIconCollection.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This collection can be used to group alternate app icons into related groups.
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

    /// Create an icon collection by mapping a set of icon names to icon values.
    ///
    /// The ``appIconName`` should be the default app icon's asset name.
    ///
    /// The `iconNames` list should be a list of plain icon names, where each
    /// icon name will be prefixed by the `iconNamePrefix` when resolving
    /// the name of the `.imageset` asset, and the `appIconNamePrefix`
    /// when resolving the name of the `.appiconset` asset.
    ///
    /// If the resulting icon name equals the default `appIconName`, the icon
    /// will reset the alternate app icon when it's selected.
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
                    name: imageName,
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

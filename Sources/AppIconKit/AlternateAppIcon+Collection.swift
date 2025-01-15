//
//  AlternateAppIcon+Collection.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension AlternateAppIcon {

    /// An alternate app icon collection can group alternate
    /// icons into related groups.
    struct Collection {
        
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
        
        /// Create an alternate app icon collection.
        ///
        /// This initializer will map the icon names to icon
        /// values by prefixing each icon name with a prefix,
        /// if any. Each icon name should be the name of the
        /// icon file, without the prefix.
        ///
        /// If a resulting app icon name equals `appIconName`,
        /// the icon will reset the selection.
        ///
        /// - Parameters:
        ///   - name: The name of the section.
        ///   - appIconName: The default app icon name.
        ///   - iconNamePrefix: The prefix to add before each icon name.
        ///   - iconNames: A list of icon names to add to the collection.
        public init(
            name: LocalizedStringKey,
            appIconName: String,
            iconNamePrefix: String = "",
            iconNames: [String]
        ) {
            self.init(
                name: name,
                icons: iconNames.map {
                    let name = "\(iconNamePrefix)\($0)"
                    let isDefaultIcon = name == appIconName
                    let iconName = isDefaultIcon ? nil : name.replacingOccurrences(of: " ", with: "")
                    return .init(icon: Image(name), iconName: iconName)
                }
            )
        }

        /// The name of the section.
        public let name: LocalizedStringKey

        /// The icons in the section.
        public let icons: [AlternateAppIcon]
    }
}

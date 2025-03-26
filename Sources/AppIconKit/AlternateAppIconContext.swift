//
//  AlternateAppIconContext.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUI

/// This observable context class can be used to managed the
/// alternate app icon for an iOS or macOS app.
@MainActor
public class AlternateAppIconContext: ObservableObject {

    /// Create an alternate app icon context instance.
    public init() {
        #if os(macOS)
        guard let alternateAppIconName else { return }
        setAlternateAppIconName(alternateAppIconName)
        #endif
    }

    /// The currently set alternate app icon name.
    @AppStorage("com.danielsaidi.appiconkit.alternateappiconname")
    public private(set) var alternateAppIconName: String?
}

public extension AlternateAppIconContext {

    /// Reset the alternate app icon.
    func resetAlternateAppIcon() {
        guard alternateAppIconName != nil else { return }
        setAlternateAppIconName(nil)
    }

    /// Set a certain alternate app icon.
    func setAlternateAppIcon(
        _ icon: AlternateAppIcon
    ) {
        setAlternateAppIconName(icon.appIconName)
    }

    /// Set an alternate app icon with a certain name.
    func setAlternateAppIconName(
        _ name: String?
    ) {
        alternateAppIconName = name
        #if os(iOS) || os(tvOS)
        UIApplication.shared.setAlternateIconName(name)
        #elseif os(macOS)
        if let name {
            NSApplication.shared.applicationIconImage = Bundle.main.image(forResource: name)
        } else {
            NSApplication.shared.applicationIconImage = nil
        }
        #endif
    }
}

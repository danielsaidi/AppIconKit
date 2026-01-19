//
//  AlternateAppIconContext.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024-2026 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUI

/// This class can be used to managed the alternate app icon
/// of the current app.
///
/// You can use the ``AlternateAppIcon`` directly instead if
/// you don't need to show the selected icon within your app.
@MainActor
public final class AlternateAppIconContext: ObservableObject {

    /// Create a context instance.
    public init() {
        #if os(macOS) || targetEnvironment(macCatalyst)
        guard let alternateAppIconName else { return }
        setAlternateAppIcon(named: alternateAppIconName)
        #endif
    }

    /// The current alternate app icon name, if any.
    @AppStorage("com.danielsaidi.appiconkit.alternateappiconname")
    public private(set) var alternateAppIconName: String?
}

public extension AlternateAppIconContext {

    /// Reset the alternate app icon.
    func resetAlternateAppIcon() {
        guard alternateAppIconName != nil else { return }
        setAlternateAppIcon(named: nil)
    }

    /// Set a certain alternate app icon.
    func setAlternateAppIcon(
        _ icon: AlternateAppIcon
    ) {
        setAlternateAppIcon(named: icon.appIconName)
    }

    @available(*, deprecated, renamed: "setAlternateAppIcon(named:)")
    func setAlternateAppIconName(
        _ name: String?
    ) {
        setAlternateAppIcon(named: name)
    }

    /// Set an alternate app icon with a certain name.
    func setAlternateAppIcon(
        named name: String?
    ) {
        if AlternateAppIcon.setCurrentIcon(named: name) {
            alternateAppIconName = name
        }
    }
}

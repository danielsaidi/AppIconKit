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
public final class AlternateAppIconContext: NSObject, ObservableObject {

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
        #if targetEnvironment(macCatalyst)
        if let nsApplication = NSClassFromString("NSApplication") as? NSObject.Type,
           let shared = nsApplication.value(forKey: "sharedApplication") as? NSObject {
            if let name, let imagePerform = Bundle.main.perform(NSSelectorFromString("imageForResource:"), with: name), let image = imagePerform.takeUnretainedValue() as? NSObject {
                shared.setValue(image, forKey: "applicationIconImage")
            } else {
                alternateAppIconName = nil
                shared.setValue(nil, forKey: "applicationIconImage")
            }
        }
        #elseif os(iOS) || os(tvOS)
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

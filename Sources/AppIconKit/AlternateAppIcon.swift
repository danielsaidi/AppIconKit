//
//  AlternateAppIcon.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This model represents an alternate app icon.
///
/// This type can also be used to manage alternate app icons.
/// Use the ``AlternateAppIconContext`` to observe the state
/// in e.g. a SwiftUI app. Use this class if you do not need
/// to show the currently selected icon.
///
/// The ``icon`` property is the `.imageset` to use when the
/// icon is listed in e.g. a picker, while the ``appIconName``
/// is the name of the `.appiconset` to set when the icon is
/// selected. A `nil` value should reset the icon.
public struct AlternateAppIcon: Identifiable {

    /// Create an alternate app icon value.
    ///
    /// - Parameters:
    ///   - name: The icon name.
    ///   - icon: The icon asset to display.
    ///   - appIconName: The name of the `.appiconset` asset, if any.
    public init(
        name: String,
        icon: Image,
        appIconName: String?
    ) {
        self.name = name
        self.icon = icon
        self.appIconName = appIconName
    }
    
    /// The unique icon ID.
    public var id: String { appIconName ?? "app" }

    /// The icon name.
    public let name: String

    /// The icon asset to display.
    public let icon: Image

    /// The name of the `.appiconset` asset, if any.
    public let appIconName: String?
}

@MainActor
public extension AlternateAppIcon {

    /// Reset the current alternate app icon, if any.
    static func resetCurrent() {
        setCurrentIcon(named: nil)
    }

    /// Set the icon as the current alternate app icon.
    func setAsCurrent() {
        Self.setCurrentIcon(named: appIconName)
    }

    /// Set an alternate app icon with a certain name.
    ///
    /// - Parameters:
    ///   - name: The name of the `.appiconset` asset to set.
    ///
    /// - Returns: Whether the operation suceeded or not.
    @discardableResult
    static func setCurrentIcon(
        named name: String?
    ) -> Bool {
        #if targetEnvironment(macCatalyst)
        if let nsApplication = NSClassFromString("NSApplication") as? NSObject.Type,
           let shared = nsApplication.value(forKey: "sharedApplication") as? NSObject {
            if let name, let imagePerform = Bundle.main.perform(NSSelectorFromString("imageForResource:"), with: name), let image = imagePerform.takeUnretainedValue() as? NSObject {
                shared.setValue(image, forKey: "applicationIconImage")
                return true
            } else {
                shared.setValue(nil, forKey: "applicationIconImage")
                return false
            }
        }
        #elseif os(iOS) || os(tvOS) || os(visionOS)
        UIApplication.shared.setAlternateIconName(name)
        return true
        #elseif os(macOS)
        if let name {
            NSApplication.shared.applicationIconImage = Bundle.main.image(forResource: name)
            return true
        } else {
            NSApplication.shared.applicationIconImage = nil
            return false
        }
        #endif
        return false
    }
}

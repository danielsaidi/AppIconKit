//
//  AlternateAppIconItem.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension AlternateAppIcon {

    /// This view can be used to list alternate app icons in
    /// a list or grid.
    ///
    /// You can style this component with the style modifier
    /// ``SwiftUICore/View/alternateAppIconItemStyle(_:)``.
    struct Item: View {

        /// Create an alternate icon list item.
        ///
        /// - Parameters:
        ///   - icon: The alternate app icon to display.
        ///   - isSelected: Whether or not the icon is selected.
        public init(
            icon: AlternateAppIcon,
            isSelected: Bool = false
        ) {
            self.init(
                icon: icon.icon,
                iconName: icon.iconName,
                isSelected: isSelected
            )
        }

        /// Create an alternate icon list item.
        ///
        /// - Parameters:
        ///   - icon: The icon asset.
        ///   - iconName: The name of the icon.
        ///   - isSelected: Whether or not the icon is selected.
        public init(
            icon: Image,
            iconName: String,
            isSelected: Bool = false
        ) {
            self.icon = icon
            self.iconName = iconName
            self.isSelected = isSelected
        }

        private let icon: Image
        private let iconName: String
        private let isSelected: Bool

        @Environment(\.alternateAppIconItemStyle)
        private var style

        public var body: some View {
            GeometryReader { geo in
                icon.resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(0.225 * geo.size.width)
                    .shadow(
                        color: style.iconShadowColor,
                        radius: 0,
                        x: 0,
                        y: style.iconShadowSize)
                    .overlay(alignment: style.checkmarkAlignment) {
                        checkmark(for: geo)
                    }
            }
            .frame(width: style.iconSize, height: style.iconSize)
        }
    }

}

private extension AlternateAppIcon.Item {

    func checkmark(for geo: GeometryProxy) -> some View {
        Image(systemName: "checkmark")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 0.15 * geo.size.width)
            .padding(7)
            .foregroundStyle(style.checkmarkForegroundColor)
            .background(style.checkmarkBackgroundColor)
            .clipShape(.circle)
            .font(.body.bold())
            .shadow(
                color: style.checkmarkShadowColor,
                radius: 0,
                x: 0,
                y: style.checkmarkShadowSize)
            .padding(0.1 * geo.size.width)
            .opacity(isSelected ? 1 : 0)
    }
}

public extension AlternateAppIcon {

    /// This style can style an ``AlternateAppIcon/Item``.
    struct ItemStyle: Sendable {

        /// Create a custom style.
        ///
        /// - Parameters:
        ///   - iconSize: The icon size, by default `125` points.
        ///   - iconShadowColor: The icon shadow color, by default transparent `.black`.
        ///   - iconShadowSize: The icon shadow size, by default `1` point.
        ///   - checkmarkAlignment: The checkmark alignment, by default `.topTrailing`.
        ///   - checkmarkForegroundColor: The checkmark foreground color, by default `.white`.
        ///   - checkmarkBackgroundColor: The checkmark background color, by default `.green`.
        ///   - checkmarkShadowColor: The checkmark shadow color, by default transparent `.black`.
        ///   - checkmarkShadowSize: The checkmark shadow size, by default `1` point.
        public init(
            iconSize: Double = 125,
            iconShadowColor: Color = .black.opacity(0.4),
            iconShadowSize: Double = 1,
            checkmarkAlignment: Alignment = .topTrailing,
            checkmarkForegroundColor: Color = .white,
            checkmarkBackgroundColor: Color = .green,
            checkmarkShadowColor: Color = .black.opacity(0.4),
            checkmarkShadowSize: Double = 1
        ) {
            self.iconSize = iconSize
            self.iconShadowColor = iconShadowColor
            self.iconShadowSize = iconShadowSize
            self.checkmarkAlignment = checkmarkAlignment
            self.checkmarkForegroundColor = checkmarkForegroundColor
            self.checkmarkBackgroundColor = checkmarkBackgroundColor
            self.checkmarkShadowColor = checkmarkShadowColor
            self.checkmarkShadowSize = checkmarkShadowSize
        }

        public var iconSize: Double
        public var iconShadowColor: Color
        public var iconShadowSize: Double
        public var checkmarkAlignment: Alignment
        public var checkmarkForegroundColor: Color
        public var checkmarkBackgroundColor: Color
        public var checkmarkShadowColor: Color
        public var checkmarkShadowSize: Double
    }
}

public extension AlternateAppIcon.ItemStyle {

    /// The standard alternate app icon item style.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a ``AlternateAppIcon/ItemStyle``.
    func alternateAppIconItemStyle(
        _ style: AlternateAppIcon.ItemStyle
    ) -> some View {
        self.environment(\.alternateAppIconItemStyle, style)
    }
}

public extension EnvironmentValues {

    /// Apply a ``AlternateAppIcon/ItemStyle``.
    @Entry var alternateAppIconItemStyle = AlternateAppIcon.ItemStyle.standard
}

#Preview {
    
    HStack {

        AlternateAppIcon.Item(
            icon: .init(.appIcon),
            iconName: "AppIcon",
            isSelected: true
        )

        AlternateAppIcon.Item(
            icon: .init(.appIcon),
            iconName: "AppIcon",
            isSelected: false
        )
    }
}

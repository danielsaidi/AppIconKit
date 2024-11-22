//
//  AlternateAppIconShelves.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension AlternateAppIcon {

    /// This view lists alternate icon sections in a list of
    /// horizontally scrolling shelves.
    ///
    /// The shelves will use ``AlternateAppIcon/Item`` views.
    /// You can style this component with the style modifier
    /// ``alternateAppIconShelfStyle(_:)``.
    ///
    /// You can also apply a `.buttonStyle` to customize how
    /// each item button behaves.
    struct Shelf: View {

        /// Create an alternate app icon shelves view.
        ///
        /// - Parameters:
        ///   - sections: The sections to display in the shelves.
        ///   - context: The icon context to affect.
        ///   - onIconSelected: An extra action to trigger when an icon is selected.
        public init(
            sections: [AlternateAppIcon.Section],
            context: AlternateAppIconContext,
            onIconSelected: @escaping (AlternateAppIcon) -> Void
        ) {
            self.sections = sections
            self.context = context
            self.onIconSelected = onIconSelected
        }

        private let sections: [AlternateAppIcon.Section]
        private let onIconSelected: (AlternateAppIcon) -> Void

        @Environment(\.alternateAppIconShelfStyle)
        private var style

        @ObservedObject
        private var context: AlternateAppIconContext

        public var body: some View {
            ScrollView(.vertical) {
                LazyVStack(spacing: style.sectionSpacing) {
                    ForEach(Array(sections.enumerated()), id: \.offset) { section in
                        VStack(alignment: .leading, spacing: style.sectionTitleSpacing) {
                            shelfTitle(for: section.element)
                            shelf(for: section.element)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(style.backgroundColor)
            .alternateAppIconItemStyle(style.itemStyle)
        }
    }
}

private extension AlternateAppIcon.Shelf {

    func shelf(for section: AlternateAppIcon.Section) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: style.itemSpacing) {
                ForEach(Array(section.icons.enumerated()), id: \.offset) {
                    shelfItem(for: $0.element)
                }
            }
            .padding(.horizontal, style.sectionPadding)
        }
        .scrollClipDisabled()
    }

    func shelfItem(for icon: AlternateAppIcon) -> some View {
        Button {
            selectIcon(icon)
        } label: {
            AlternateAppIcon.Item(
                icon: icon,
                isSelected: context.alternateAppIconName == icon.iconName
            )
        }
    }

    func shelfTitle(for section: AlternateAppIcon.Section) -> some View {
        Text(section.name)
            .font(.footnote)
            .textCase(.uppercase)
            .foregroundColor(.secondary)
            .padding(.horizontal, style.sectionPadding)
            .padding(.horizontal, 0.1 * style.itemStyle.iconSize)
    }
}

private extension AlternateAppIcon.Shelf {

    func selectIcon(_ icon: AlternateAppIcon) {
        withAnimation {
            onIconSelected(icon)
            context.setAlternateAppIcon(icon)
        }
    }
}

public extension AlternateAppIcon {

    /// This style can style a ``AlternateAppIcon/Shelf``.
    struct ShelfStyle: Sendable {

        /// Create a custom style.
        ///
        /// - Parameters:
        ///   - sectionSpacing: The spacing between sections, by default `20`.
        ///   - sectionTitleSpacing: The spacing between section title and items, by default `10`.
        ///   - sectionPadding: The horizontal padding of each section, by default `nil`.
        ///   - itemStyle: The item style, by default `.standard`.
        ///   - itemSpacing: The spacing between items, by default `16`.
        ///   - backgroundColor: The shelf background color.
        public init(
            sectionSpacing: Double = 20,
            sectionTitleSpacing: Double = 10,
            sectionPadding: CGFloat? = nil,
            itemStyle: ItemStyle = .standard,
            itemSpacing: Double = 16,
            backgroundColor: Color = .primary.opacity(0.05)
        ) {
            self.sectionSpacing = sectionSpacing
            self.sectionTitleSpacing = sectionTitleSpacing
            self.sectionPadding = sectionPadding
            self.itemStyle = itemStyle
            self.itemSpacing = itemSpacing
            self.backgroundColor = backgroundColor
        }

        public var sectionSpacing: Double
        public var sectionTitleSpacing: Double
        public var sectionPadding: CGFloat?
        public var itemStyle: ItemStyle
        public var itemSpacing: Double
        public var backgroundColor: Color
    }
}

public extension AlternateAppIcon.ShelfStyle {

    /// The standard alternate app icon item style.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a ``AlternateAppIcon/ShelfStyle``.
    func alternateAppIconShelfStyle(
        _ style: AlternateAppIcon.ShelfStyle
    ) -> some View {
        self.environment(\.alternateAppIconShelfStyle, style)
    }
}

public extension EnvironmentValues {

    /// Apply a ``AlternateAppIcon/ShelfStyle``.
    @Entry var alternateAppIconShelfStyle = AlternateAppIcon.ShelfStyle.standard
}

#Preview {

    struct Preview: View {

        init() {
            let icon1 = AlternateAppIcon(icon: .init(.appIcon), iconName: "AppIcon1")
            let icon2 = AlternateAppIcon(icon: .init(.appIcon), iconName: "AppIcon2")
            let icon3 = AlternateAppIcon(icon: .init(.appIcon), iconName: "AppIcon3")

            self.sections = [
                .init(name: "Section 1", icons: [icon1, icon2, icon3]),
                .init(name: "Section 2", icons: [icon1, icon2]),
                .init(name: "Section 3", icons: [icon1]),
                .init(name: "Section 4", icons: [icon1, icon2]),
                .init(name: "Section 5", icons: [icon1, icon2, icon3])
            ]
        }

        @StateObject var context = AlternateAppIconContext()

        let sections: [AlternateAppIcon.Section]

        var body: some View {
            AlternateAppIcon.Shelf(sections: sections, context: context) { icon in
                print(icon.iconName)
            }
        }
    }

    return Preview()
}

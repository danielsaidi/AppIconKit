//
//  AlternateAppIconShelves.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view lists alternate icon collections in a list
/// of horizontally scrolling shelves.
///
/// The shelves will use ``AlternateAppIcon/Item`` views.
/// You can style this component with the style modifier
/// ``alternateAppIconShelfStyle(_:)``.
///
/// You can also apply a `.buttonStyle` to customize how
/// each item button behaves.
public struct AlternateAppIconShelf: View {

    /// Create an alternate app icon shelves view.
    ///
    /// - Parameters:
    ///   - collections: The collections to display as shelves.
    ///   - context: The icon context to affect.
    ///   - onIconSelected: An extra action to trigger when an icon is selected, if any.
    public init(
        collections: [AlternateAppIconCollection],
        context: AlternateAppIconContext,
        onIconSelected: @escaping (AlternateAppIcon) -> Void = { _ in }
    ) {
        self.collections = collections
        self.context = context
        self.onIconSelected = onIconSelected
    }

    private let collections: [AlternateAppIconCollection]
    private let onIconSelected: (AlternateAppIcon) -> Void

    @Environment(\.alternateAppIconShelfStyle)
    private var style

    @ObservedObject
    private var context: AlternateAppIconContext

    public var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: style.sectionSpacing) {
                ForEach(Array(collections.enumerated()), id: \.offset) { section in
                    VStack(alignment: .leading, spacing: style.sectionTitleSpacing) {
                        shelfTitle(for: section.element)
                        shelf(for: section.element)
                    }
                }
            }
            .padding(.vertical, style.scrollPadding)
        }
        .withHiddenScrollContent()
        .background(style.backgroundColor)
        .alternateAppIconListItemStyle(style.itemStyle)
    }
}

private extension View {

    func withHiddenScrollContent() -> some View {
        #if os(tvOS)
        self
        #else
        self.scrollContentBackground(.hidden)
        #endif
    }
}

private extension AlternateAppIconShelf {

    func shelf(for collection: AlternateAppIconCollection) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: style.itemSpacing) {
                ForEach(Array(collection.icons.enumerated()), id: \.offset) {
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
            AlternateAppIconListItem(
                icon: icon,
                isSelected: context.alternateAppIconName == icon.appIconName
            )
        }
        .buttonStyle(.plain)
    }

    func shelfTitle(for collection: AlternateAppIconCollection) -> some View {
        Text(collection.name)
            .font(.footnote)
            .textCase(.uppercase)
            .foregroundColor(.secondary)
            .padding(.horizontal, style.sectionPadding)
            .padding(.horizontal, 0.1 * style.itemStyle.iconSize)
    }
}

private extension AlternateAppIconShelf {

    func selectIcon(_ icon: AlternateAppIcon) {
        withAnimation {
            onIconSelected(icon)
            context.setAlternateAppIcon(icon)
        }
    }
}

public extension AlternateAppIconShelf {

    /// This style can style a ``AlternateAppIconShelf``.
    struct Style: Sendable {

        /// Create a custom style.
        ///
        /// - Parameters:
        ///   - scrollPadding: The vertical scroll padding, by default `20`.
        ///   - sectionSpacing: The spacing between sections, by default `40`.
        ///   - sectionTitleSpacing: The spacing between section title and items, by default `10`.
        ///   - sectionPadding: The horizontal padding of each section, by default `nil`.
        ///   - itemStyle: The item style, by default `.standard`.
        ///   - itemSpacing: The spacing between items, by default `16`.
        ///   - backgroundColor: The shelf background color.
        public init(
            scrollPadding: Double = 20,
            sectionSpacing: Double = 40,
            sectionTitleSpacing: Double = 10,
            sectionPadding: CGFloat? = nil,
            itemStyle: AlternateAppIconListItem.Style = .standard,
            itemSpacing: Double = 16,
            backgroundColor: Color = .primary.opacity(0.05)
        ) {
            self.scrollPadding = scrollPadding
            self.sectionSpacing = sectionSpacing
            self.sectionTitleSpacing = sectionTitleSpacing
            self.sectionPadding = sectionPadding
            self.itemStyle = itemStyle
            self.itemSpacing = itemSpacing
            self.backgroundColor = backgroundColor
        }

        public var scrollPadding: Double
        public var sectionSpacing: Double
        public var sectionTitleSpacing: Double
        public var sectionPadding: CGFloat?
        public var itemStyle: AlternateAppIconListItem.Style
        public var itemSpacing: Double
        public var backgroundColor: Color
    }
}

public extension AlternateAppIconShelf.Style {

    /// The standard alternate app icon item style.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a ``AlternateAppIconShelf/Style``.
    func alternateAppIconShelfStyle(
        _ style: AlternateAppIconShelf.Style
    ) -> some View {
        self.environment(\.alternateAppIconShelfStyle, style)
    }
}

public extension EnvironmentValues {

    /// Apply a ``AlternateAppIconShelf/Style``.
    @Entry var alternateAppIconShelfStyle = AlternateAppIconShelf.Style.standard
}

#Preview {

    struct Preview: View {

        init() {
            let icon1 = AlternateAppIcon(icon: .init(.appIcon), appIconName: nil)
            let icon2 = AlternateAppIcon(icon: .init(.appIcon), appIconName: "AppIcon2")
            let icon3 = AlternateAppIcon(icon: .init(.appIcon), appIconName: "AppIcon3")

            self.collections = [
                .init(name: "Section 1", icons: [icon1, icon2, icon3]),
                .init(name: "Section 2", icons: [icon1, icon2]),
                .init(name: "Section 3", icons: [icon1]),
                .init(name: "Section 4", icons: [icon1, icon2]),
                .init(name: "Section 5", icons: [icon1, icon2, icon3])
            ]
        }

        @StateObject var context = AlternateAppIconContext()

        let collections: [AlternateAppIconCollection]

        var body: some View {
            AlternateAppIconShelf(
                collections: collections,
                context: context
            ) { icon in
                print(icon.appIconName ?? "Default")
            }
        }
    }

    return Preview()
}

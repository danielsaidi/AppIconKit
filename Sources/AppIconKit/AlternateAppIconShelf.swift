//
//  AlternateAppIconShelves.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2024-11-22.
//  Copyright © 2024-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This shelf lists icons in horizontally scrolling shelves.
///
/// You can style the view with ``alternateAppIconShelfStyle(_:)`` and
/// apply a `.buttonStyle` to style the various item buttons.
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
        self.sections = collections.map { .init(title: $0.name, items: $0.icons) }
        self.context = context
        self.onIconSelected = onIconSelected
    }
    
    public typealias Section = ItemShelfSection<AlternateAppIcon>

    private let sections: [Section]
    private let onIconSelected: (AlternateAppIcon) -> Void

    @Environment(\.alternateAppIconShelfStyle)
    private var style

    @ObservedObject
    private var context: AlternateAppIconContext

    public var body: some View {
        ItemShelf(sections: sections, itemView: itemView)
    }
}

private extension AlternateAppIconShelf {

    func itemView(for icon: AlternateAppIcon) -> some View {
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
    typealias Style = ItemShelfStyle
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
            let icon1 = AlternateAppIcon(
                name: "icon1",
                icon: .init(.appIcon),
                appIconName: nil
            )
            let icon2 = AlternateAppIcon(
                name: "icon2",
                icon: .init(.appIcon),
                appIconName: "AppIcon2"
            )
            let icon3 = AlternateAppIcon(
                name: "icon3",
                icon: .init(.appIcon),
                appIconName: "AppIcon3"
            )

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

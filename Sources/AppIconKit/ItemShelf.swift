//
//  ItemShelf.swift
//  AppIconKit
//
//  Created by Daniel Saidi on 2025-01-20.
//  Copyright © 2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This general shelf can be used to list any kind of items
/// in horizontally scrolling shelves.
///
/// This component is used by ``AlternateAppIconShelf``, and
/// is exposed so that you can reuse it if an apps have more
/// shels that should look the same.
public struct ItemShelf<ItemType: Identifiable, ItemView: View>: View {
    
    public init(
        sections: [Section],
        itemView: @escaping (ItemType) -> ItemView
    ) {
        self.sections = sections
        self.itemView = itemView
    }
    
    public typealias Section = ItemShelfSection<ItemType>
    
    private let sections: [Section]
    private let itemView: (ItemType) -> ItemView
    
    @Environment(\.itemShelfStyle)
    private var style
    
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
            .padding(.vertical, style.scrollPadding)
        }
        .withHiddenScrollContent()
        .background(style.backgroundColor)
    }
}

private extension ItemShelf {

    func shelf(for section: Section) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: style.itemSpacing) {
                ForEach(Array(section.items.enumerated()), id: \.offset) {
                    itemView($0.element)
                }
            }
            .padding(.horizontal, style.sectionPadding)
        }
        .scrollClipDisabled()
    }

    func shelfTitle(for collection: Section) -> some View {
        Text(collection.title)
            .font(.footnote)
            .textCase(.uppercase)
            .foregroundColor(.secondary)
            .padding(.horizontal, style.sectionPadding)
            .padding(.horizontal, 10)
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

/// This type can be used to define an item shelf section.
public struct ItemShelfSection<ItemType: Identifiable> {
    
    public init(
        title: LocalizedStringKey,
        items: [ItemType]
    ) {
        self.title = title
        self.items = items
    }
    
    public let title: LocalizedStringKey
    public let items: [ItemType]
}

/// This style can be used to style ``ItemShelf`` views.
///
/// You can apply custom style values with the view modifier
/// ``SwiftUICore/View/itemShelfStyle(_:)``.
public struct ItemShelfStyle: Sendable {

    /// Create a custom style.
    ///
    /// - Parameters:
    ///   - scrollPadding: The main component padding, by default `20`.
    ///   - sectionSpacing: The spacing between sections, by default `40`.
    ///   - sectionTitleSpacing: The spacing between section title and items, by default `10`.
    ///   - sectionPadding: The horizontal padding of each section, by default `nil`.
    ///   - itemSpacing: The spacing between items, by default `16`.
    ///   - backgroundColor: The shelf background color.
    public init(
        scrollPadding: Double = 20,
        sectionSpacing: Double = 40,
        sectionTitleSpacing: Double = 10,
        sectionPadding: CGFloat? = nil,
        itemSpacing: Double = 16,
        backgroundColor: Color = .primary.opacity(0.05)
    ) {
        self.scrollPadding = scrollPadding
        self.sectionSpacing = sectionSpacing
        self.sectionTitleSpacing = sectionTitleSpacing
        self.sectionPadding = sectionPadding
        self.itemSpacing = itemSpacing
        self.backgroundColor = backgroundColor
    }

    public var scrollPadding: Double
    public var sectionSpacing: Double
    public var sectionTitleSpacing: Double
    public var sectionPadding: CGFloat?
    public var itemSpacing: Double
    public var backgroundColor: Color
}

public extension ItemShelfStyle {

    /// The standard item shelf style.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a ``ItemShelfStyle`` to style an ``ItemShelf``.
    func itemShelfStyle(
        _ style: ItemShelfStyle
    ) -> some View {
        self.environment(\.itemShelfStyle, style)
    }
}

public extension EnvironmentValues {

    /// Apply a ``ItemShelfStyle``.
    @Entry var itemShelfStyle = ItemShelfStyle.standard
}

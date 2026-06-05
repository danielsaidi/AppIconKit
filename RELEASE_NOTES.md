# Release Notes

[AppIconKit](https://github.com/danielsaidi/AppIconKit) will use semantic versioning after 1.0.


## 0.9

This version adds support for macOS Catalyst and Vision Pro,
and adds icon logic directly to the `AlternateAppIcon` type. 

### ✨ Features

* The SDK now supports macOS Catalyst.
* The `AlternateAppIcon` type has new icon setters. 



## 0.8

### 💡 Adjustments

* The package now uses Swift 6.1. 
* The demo app now targets iOS 26. 



## 0.7

This version removes previously deprecated code and adds DocC documentation to the package.



## 0.6

### ✨ Features

* The new `ItemShelf` and its related types let you design other shelves like the `AlternateAppIconShelf`. 

### 💡 Adjustments

* The `AlternateAppIconCollection` view now uses `ItemShelf` under the hood.

### 🚨 Breaking Changes

* Since `ItemShelfStyle` has no icon style, you must now apply a `.alternateAppIconListItemStyle` to style icons.  



## 0.5

### 💡 Adjustments

* The `AlternateAppIconCollection` can now define a separate app icon prefix, which is needed for macOS.

### 🚨 Breaking Changes

* Due to the required alternate app icon adjustments, this version has some breaking changes. 



## 0.4

### 💡 Adjustments

* All `AlternateAppIcon` child types have been promoted to top-level types, for clarity.
* All `AlternateAppIcon.Collection` is renamed to `AlternateAppIconCollection`.
* All `AlternateAppIcon.Item` is renamed to `AlternateAppIconListItem`.
* All `AlternateAppIconItem.Style` is renamed to `AlternateAppIconListItem.Style`.
* All `AlternateAppIcon.Shelf` is renamed to `AlternateAppIconShelf`.
* All `AlternateAppIcon.ShelfStyle` is renamed to `AlternateAppIconShelf.Style`.
* The `AlternateAppIconShelf` view no longer requires you to specify a selection action.



## 0.3.1

### 💡 Adjustments

* The `AlternateAppIconContext` now aborts resetting when no icon is set.



## 0.3

### ✨ Features

* The `AlternateAppIcon.Collection` has a new initializer that lets you set up collections in a template-driven way.



## 0.2

### ✨ Features

* The `AlternateAppIcon` and its `Item` can now use a `nil` icon name.

### 💡 Adjustments

* The `AlternateAppIconContext`'s `resetAlternateAppIcon()` no longer takes an icon.



## 0.1.1

### ✨ Features

* The `AlternateAppIconContext` has a new reset function.
* The `AlternateAppIcon.ShelfStyle` has been slightly adjusted.



## 0.1

This is the first beta version of AppIconKit.

### ✨ Features

* The `AlternateAppIcon` contains app information.
* The `AlternateAppIcon.Collection` can be used to group icons.
* The `AlternateAppIcon.Item` can render an icon in a list or grid.
* The `AlternateAppIcon.Shelf` is a vertically scrolling picker with horizontal shelves.
* The `AlternateAppIconContext` can be used to select icons and manage selection state.

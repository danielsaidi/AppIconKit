# ``AppIconKit``

AppIconKit is a Swift SDK that helps you manage alternate app icons on macOS and iOS.



## Overview

![AppIconKit logotype](Logo.png)

AppIconKit is a Swift SDK that helps you manage alternate app icons on macOS and iOS.



## Installation

AppIconKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/AppIconKit.git
```



## Getting Started

AppIconKit helps you manage alternate app icons on both macOS and iOS.

The SDK has a couple of central types:

* Use `AlternateAppIcon` to create alternate icon values for your app.
* Use `AlternateAppIconContext` to set and keep track of the current icon. 
* Use `AlternateAppIconCollection` to group icons into related collections.
* Use `AlternateAppIconListItem` when listing an app icon in lits and grids.
* Use `AlternateAppIconShelf` to list app icons in a vertical list of horizontal shelves.

You can easily create a `LazyVGrid` picker with icons, or use an `AlternateAppIconShelf`:

<p align="center">
    <img src="/Resources/device.png" alt="Screenshot" width=350 />
</p>

The `AlternateAppIconContext` will automatically restore the icon on macOS, when a context instance is created.  

> [!IMPORTANT]  
> Make sure to enable `Include All App Icon Assets` in the app Info.plist for the app to be able to pick icons. You must add an `.imageset` and an `.appiconset` for each icon, since SwiftUI can't render `.appiconset`s and the OS can't use `.imageset`s as app icon.



## Repository

For more information, source code, etc., visit the [project repository](https://github.com/danielsaidi/AppIconKit).



## License

AppIconKit is available under the MIT license.



## Topics

### Essentials

- ``AlternateAppIcon``
- ``AlternateAppIconCollection``
- ``AlternateAppIconContext``
- ``AlternateAppIconListItem``
- ``AlternateAppIconShelf``


### Item Shel

- ``ItemShelf``
- ``ItemShelfSection``
- ``ItemShelfStyle``

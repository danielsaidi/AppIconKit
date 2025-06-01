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


## Support My Work

Maintaining my various [open-source tools][OpenSource] takes significant time and effort. You can [become a sponsor][Sponsors] to help me dedicate more time to creating, maintaining, and improving these projects. Every contribution, no matter the size, makes a real difference in keeping these tools free and actively developed. Thank you for considering!



## Getting Started

AppIconKit helps you manage alternate app icons on both macOS and iOS.

The SDK has a couple of central types:

* Use ``AlternateAppIcon`` to create alternate icon values for your app.
* Use ``AlternateAppIconContext`` to set and keep track of the current icon. 
* Use ``AlternateAppIconCollection`` to group icons into related collections.
* Use ``AlternateAppIconListItem`` when listing an app icon in lits and grids.
* Use ``AlternateAppIconShelf`` to list app icons in a vertical list of horizontal shelves.

The context will automatically restore the icon on macOS, when a context instance is created.  

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


### Item Shelf

- ``ItemShelf``
- ``ItemShelfSection``
- ``ItemShelfStyle``



[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

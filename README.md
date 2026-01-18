<p align="center">
    <img src="Resources/Icon-Badge.png" alt="Project Icon" width="250" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/AppIconKit?color=%2300550&sort=semver" alt="Version" title="Version" />
    <img src="https://img.shields.io/badge/swift-6.1-orange.svg" alt="Swift 6.1" />
    <a href="https://danielsaidi.github.io/AppIconKit"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
    <a href="https://github.com/danielsaidi/AppIconKit/blob/master/LICENSE"><img src="https://img.shields.io/github/license/danielsaidi/AppIconKit" alt="MIT License" /></a>
</p>


# AppIconKit

AppIconKit is a Swift SDK that helps you manage alternate app icons on macOS and iOS.

<p align="center">
    <img src="/Resources/Preview.png" alt="Screenshot" width=300 />
</p>


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

* Use `AlternateAppIcon` to create alternate icon values for your app.
* Use `AlternateAppIconContext` to set and keep track of the current icon. 
* Use `AlternateAppIconCollection` to group icons into related collections.
* Use `AlternateAppIconListItem` when listing an app icon in lits and grids.
* Use `AlternateAppIconShelf` to list app icons in a vertical list of horizontal shelves.

The context will automatically restore the icon on macOS, when a context instance is created.  

> [!IMPORTANT]  
> Make sure to enable `Include All App Icon Assets` in the app Info.plist for the app to be able to pick icons. You must add an `.imageset` and an `.appiconset` for each icon, since SwiftUI can't render `.appiconset`s and the OS can't use `.imageset`s as app icon.   


## Documentation

The online [documentation][Documentation] has more information, articles, code examples, etc. 


## Demo Application

The `Demo` folder has a demo app that lets you explore the library and try changing the app icon.


## Support My Work

Maintaining my various [open-source tools][OpenSource] takes significant time and effort. You can [become a sponsor][Sponsors] to help me dedicate more time to creating, maintaining, and improving these projects. Every contribution, no matter the size, makes a real difference in keeping these tools free and actively developed. Thank you for considering!


## Contact

Feel free to reach out if you have questions or want to contribute in any way:

* Website: [danielsaidi.com][Website]
* E-mail: [daniel.saidi@gmail.com][Email]
* Bluesky: [@danielsaidi@bsky.social][Bluesky]
* Mastodon: [@danielsaidi@mastodon.social][Mastodon]


## License

AppIconKit is available under the MIT license. See the [LICENSE][License] file for more info.


[Email]: mailto:daniel.saidi@gmail.com
[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Bluesky]: https://bsky.app/profile/danielsaidi.bsky.social
[Mastodon]: https://mastodon.social/@danielsaidi
[Twitter]: https://twitter.com/danielsaidi

[Documentation]: https://danielsaidi.github.io/AppIconKit
[Getting-Started]: https://danielsaidi.github.io/AppIconKit/documentation/appiconkit/getting-started
[License]: https://github.com/danielsaidi/AppIconKit/blob/master/LICENSE

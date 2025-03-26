<p align="center">
    <img src ="Resources/Logo_Rounded.png" alt="AppIconKit Logo" title="AppIconKit" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/AppIconKit?color=%2300550&sort=semver" alt="Version" title="Version" />
    <img src="https://img.shields.io/badge/swift-6.0-orange.svg" alt="Swift 6.0" />
    <img src="https://img.shields.io/badge/platform-SwiftUI-blue.svg" alt="Swift UI" title="Swift UI" />
    <a href="https://danielsaidi.github.io/AppIconKit"><img src="https://img.shields.io/badge/documentation-web-blue.svg" alt="Documentation" /></a>
    <img src="https://img.shields.io/github/license/danielsaidi/AppIconKit" alt="MIT License" title="MIT License" />
</p>


# AppIconKit

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



## Documentation

The online [documentation][Documentation] has more information, articles, code examples, etc. 



## Demo Application

The `Demo` folder has a demo app that lets you explore the library and try changing the app icon.



## Support my work 

You can [sponsor me][Sponsors] on GitHub Sponsors or [reach out][Email] for paid support, to help support my [open-source projects][OpenSource].

Your support makes it possible for me to put more work into these projects and make them the best they can be.



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
[Bluesky]: https://bsky.app/profile/danielsaidi.bsky.social
[Twitter]: https://twitter.com/danielsaidi
[Mastodon]: https://mastodon.social/@danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Documentation]: https://danielsaidi.github.io/AppIconKit
[Getting-Started]: https://danielsaidi.github.io/AppIconKit/documentation/appiconkit/getting-started

[License]: https://github.com/danielsaidi/AppIconKit/blob/master/LICENSE

<p align="center">
    <img src ="Resources/Logo_Rounded.png" alt="AppIconKit Logo" title="AppIconKit" />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/AppIconKit?color=%2300550&sort=semver" alt="Version" title="Version" />
    <img src="https://img.shields.io/badge/swift-6.0-orange.svg" alt="Swift 6.0" />
    <img src="https://img.shields.io/github/license/danielsaidi/AppIconKit" alt="MIT License" title="MIT License" />
    <a href="https://twitter.com/danielsaidi"><img src="https://img.shields.io/twitter/url?label=Twitter&style=social&url=https%3A%2F%2Ftwitter.com%2Fdanielsaidi" alt="Twitter: @danielsaidi" title="Twitter: @danielsaidi" /></a>
    <a href="https://mastodon.social/@danielsaidi"><img src="https://img.shields.io/mastodon/follow/000253346?label=mastodon&style=social" alt="Mastodon: @danielsaidi@mastodon.social" title="Mastodon: @danielsaidi@mastodon.social" /></a>
</p>


## About AppIconKit

AppIconKit helps you manage alternate app icons on both macOS and iOS.



## Installation

AppIconKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/AppIconKit.git
```



## Getting Started

AppIconKit helps you manage alternate app icons on both macOS and iOS.

The SDK has a couple of central types:

* Use `AlternateAppIcon` to create a list of all alternate icons in your app. 
* Use `AlternateAppIcon.Collection` to create icon collections.
* Use an `AlternateAppIconContext` to keep track of the selected icon.

You can easily create a `LazyVGrid` picker with icons, or use an `AlternateAppIcon.Shelf`:

<p align="center">
    <img src="/Resources/device.png" alt="Screenshot" width=350 />
</p>

You can also use the context's `setAlternateAppIcon(...)` to set an icon with code.

> [!IMPORTANT]  
> Make sure to enable `Include All App Icon Assets` in the app's Info.plist for the app to be able to select icons. Also note that you must add both an `.imageset` and an `.appiconset` for each icon, since SwiftUI can't render `.appiconset`.   



## Documentation

This library will get a proper documentation once it gets more than 100 stars. 



## Demo app

The demo app lets you explore the library. To try it out, just open and run the `Demo` project.



## Support my work 

You can [sponsor me][Sponsors] on GitHub Sponsors or [reach out][Email] for paid support, to help support my [open-source projects][OpenSource].

Your support makes it possible for me to put more work into these projects and make them the best they can be.



## Contact

Feel free to reach out if you have questions or want to contribute in any way:

* Website: [danielsaidi.com][Website]
* Mastodon: [@danielsaidi@mastodon.social][Mastodon]
* Twitter: [@danielsaidi][Twitter]
* E-mail: [daniel.saidi@gmail.com][Email]



## License

AppIconKit is available under the MIT license. See the [LICENSE][License] file for more info.



[Email]: mailto:daniel.saidi@gmail.com

[Website]: https://danielsaidi.com
[GitHub]: https://github.com/danielsaidi
[Twitter]: https://twitter.com/danielsaidi
[Mastodon]: https://mastodon.social/@danielsaidi
[OpenSource]: https://danielsaidi.com/opensource
[Sponsors]: https://github.com/sponsors/danielsaidi

[Documentation]: https://danielsaidi.github.io/AppIconKit
[Getting-Started]: https://danielsaidi.github.io/AppIconKit/documentation/appiconkit/getting-started

[License]: https://github.com/danielsaidi/AppIconKit/blob/master/LICENSE

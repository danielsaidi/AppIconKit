# Release Notes

ApiKit will use semver after 1.0. 

Until then, breaking changes can happen in any version, and deprecated features may be removed in any minor version bump.



## 0.9.2

This version adds an `ApiModel` protocol that simplifies conforming to `Codable` and `Sendable`.



## 0.9.1

This version adjusts HTTP status code terminology.

### ✨ New Features

* `ApiClient` lets you provide a custom decoder.
* `ApiError` has a new `invalidHttpStatusCode` error.
* `ApiError` has a new `unsuccessfulHttpStatusCode` error.

### 💡 Adjustments

* `100-599` is valid.
* `100-199` and `300-599` is unsuccessful, not invalid.
* All other status codes are invalid, since they're not in the spec. 



## 0.9

This version removes all deprecated code and makes the SDK use Swift 6. 



## 0.8

This version renames client functions to use the "request" terminology for more consistent naming. 

### 🗑️ Deprecations

* `ApiClient` has renamed all `fetch` operations to `request`.

### 💥 Breaking changes

* `ApiClient` `fetchData` is renamed to `data` to match `URLSession`.



## 0.7

### ✨ New Features

* ApiKit now supports visionOS.

### 💥 Breaking changes

* SystemNotification now requires Swift 5.9.



## 0.6

### ✨ New Features

* `ApiClient` now validates the response status code.
* `ApiClient` can perform even more fetch operations.
* `ApiError` has a new `invalidResponseStatusCode` error.

### 💥 Breaking Changes

* `ApiClient` now only requires a data fetch implementation.



## 0.5

### ✨ New Features

* `ApiClient` has a new `fetch(_:in:)` for fetching routes.
* `ApiRequest` is a new type that simplifies fetching data.

### 💥 Breaking Changes

* `ApiError.noDataInResponse` has been removed.
* `ApiResult` properties are no longer optional.



## 0.4

This version uses Swift 5.9 and renames some integration types.



## 0.3

### ✨ New Features

* `Yelp` is a new namespace with Yelp API integrations.



## 0.2.1

This version makes ApiKit support PATCH requests.

### ✨ New Features

* `HttpMethod` now has a new `patch` case.



## 0.2

This version adds supports for headers and for the environment to define global headers and query parameters.

### ✨ New Features

* `ApiRequestData` is a new protocol that is implemented by both `ApiEnvironment` and `ApiRoute`.
* `ApiEnvironment` and `ApiRoute` can now define custom headers.
* `TheMovieDB` is a new type that can be used to integrate with The Movie DB api. 

### 💡 Behavior Changes

* All request data is now optional.
* URL request creation is now throwing.
* URL requests will now combine data from the environment and route.

### 🐛 Bug fixes

* `ApiRequestData` removes the not needed url encoding.

### 💥 Breaking Changes

* `ApiEnvironment` now uses a `String` as url.
* `ApiRequestData` makes the `queryParams` property optional.
* `ApiRoute` makes the `formParams` property optional.



## 0.1

This is the first public release of ApiKit.

### ✨ New Features

* You can create `ApiEnvironment` and `ApiRoute` implementations and use them with `ApiClient`.
* `URLSession` implements `ApiClient` so you don't need a custom implementation

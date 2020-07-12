# RandomAccessCollectionBinarySearch
![](https://img.shields.io/badge/platforms-iOS%2010%20%7C%20tvOS%2010%20%7C%20watchOS%204%20%7C%20macOS%2010.14-red)
[![Xcode](https://img.shields.io/badge/Xcode-11-blueviolet.svg)](https://developer.apple.com/xcode)
[![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)](https://swift.org)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/wltrup/RandomAccessCollectionBinarySearch)
![GitHub](https://img.shields.io/github/license/wltrup/RandomAccessCollectionBinarySearch)

## What

**RandomAccessCollectionBinarySearch** is a Swift Package Manager package for iOS/tvOS (10.0 and above), watchOS (4.0 and above), and macOS (10.14 and above), under Swift 5.0 and above,  implementing an extension to `RandomAccessCollection` to add support for performing binary searches on sorted collections:
```swift
public extension RandomAccessCollection where Element: Comparable {

    // Returns the index of the target element, if it exists in the
    // input collection, or `nil`, if it does not. It is assumed that
    // the collection is sorted.

    static func binarySearch(in input: Self, for targetElement: Element) -> Index?

    func binarySearch(for targetElement: Element) -> Index?

    // Returns a tuple containing the indices of the two collection elements
    // that narrowly bracket the target element in the input collection
    // (assumed sorted), as well as the index of the target element itself.

    static func binarySearchLoHi(in input: Self, for targetElement: Element)
        -> (low: Index?, target: Index?, high: Index?)

    func binarySearchLoHi(for targetElement: Element)
        -> (low: Index?, target: Index?, high: Index?)

}
```

## Installation

**RandomAccessCollectionBinarySearch** is provided only as a Swift Package Manager package, because I'm moving away from CocoaPods and Carthage, and can be easily installed directly from Xcode.

## Author

Wagner Truppel, trupwl@gmail.com

## License

**RandomAccessCollectionBinarySearch** is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.

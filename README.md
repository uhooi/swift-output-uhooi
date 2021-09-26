# swift-output-uhooi

[![CI](https://github.com/uhooi/swift-output-uhooi/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/uhooi/swift-output-uhooi/actions/workflows/main.yml)
[![Release](https://img.shields.io/github/v/release/uhooi/swift-output-uhooi)](https://github.com/uhooi/swift-output-uhooi/releases/latest)
[![Swift Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fuhooi%2Fswift-output-uhooi%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/uhooi/swift-output-uhooi)
[![Platform Compatibility](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fuhooi%2Fswift-output-uhooi%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/uhooi/swift-output-uhooi)
[![License](https://img.shields.io/github/license/uhooi/swift-output-uhooi)](https://github.com/uhooi/swift-output-uhooi/blob/main/LICENSE)
[![Twitter](https://img.shields.io/twitter/follow/the_uhooi?style=social)](https://twitter.com/the_uhooi)

Uhooi speak the phrase.

## Table of Contents

- [Installation](#installation)
- [How to use](#how-to-use)
- [Contribution](#contribution)

## Installation

### Mint

```shell
$ mint install uhooi/swift-output-uhooi

$ mint run uhooi/swift-output-uhooi uhooi -h
```

### Swift Package Manager

1. Create a folder for the CLI tools.  
Example: `FooTools` folder.

2. In this folder, create a file called `Package.swift` , with the following contents:

```swift
// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "FooTools",
    platforms: [
        .macOS(.v10_10),
    ],
    dependencies: [
        .package(url: "https://github.com/uhooi/swift-output-uhooi", exact: "0.1.0"),
    ],
    targets: [.target(name: "FooTools", path: "")]
)
```

3. If you are running Xcode 11.4 or later, in the `FooTools` folder create a file called `Empty.swift` with nothing in it. This is to satisfy a change in Swift Package Manager.

4. Build and run.

```shell
$ swift build -c release ----package-path FooTools --product uhooi

$ FooTools/.build/release/uhooi -h
```

### Clone and Build/run

```shell
$ git clone https://github.com/uhooi/swift-output-uhooi.git
$ cd swift-output-uhooi
$ swift build -c release

$ .build/release/uhooi -h
```

## How to use

```
$ uhooi uhooooi
┌|▼▼|┘<uhooooi

$ uhooi "I'm uhooi."
┌|▼▼|┘<I'm uhooi.

$ uhooi --count 2 "I'm uhooi."
┌|▼▼|┘<I'm uhooi.
┌|▼▼|┘<I'm uhooi.

$ uhooi --include-counter --count 2 "I'm uhooi."
1: ┌|▼▼|┘<I'm uhooi.
2: ┌|▼▼|┘<I'm uhooi.
```

## Contribution

I would be happy if you contribute :)

- [New issue](https://github.com/uhooi/swift-output-uhooi/issues/new)
- [New pull request](https://github.com/uhooi/swift-output-uhooi/compare)

# swift-output-uhooi

[![CI](https://github.com/uhooi/swift-output-uhooi/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/uhooi/swift-output-uhooi/actions/workflows/main.yml)
[![Release](https://img.shields.io/github/v/release/uhooi/swift-output-uhooi)](https://github.com/uhooi/swift-output-uhooi/releases/latest)
[![License](https://img.shields.io/github/license/uhooi/swift-output-uhooi)](https://github.com/uhooi/swift-output-uhooi/blob/main/LICENSE)
[![Twitter](https://img.shields.io/twitter/follow/the_uhooi?style=social)](https://twitter.com/the_uhooi)

Uhooi speak the phrase.

## Table of Contents

- [Installation](#installation)
- [How to use](#how-to-use)
- [Contribution](#contribution)

## Installation

### Homebrew

TBD

### Mint

TBD

### Swift Package Manager

TBD

### Manual

```shell
$ git clone https://github.com/uhooi/swift-output-uhooi.git
$ cd swift-output-uhooi
$ swift build -c release

$ .build/release/uhooi uhooooi
┌|▼▼|┘<uhooooi
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

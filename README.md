# Pigment

[![Build Status](https://travis-ci.org/bregydoc/pigment.svg?branch=master)](https://travis-ci.org/bregydoc/pigment)

Useful and simple flutter color handler.

## Usage

To use this plugin, add `pigment` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Examples

Here are some examples of how to use this library.

```dart
// from a CSS color name
Pigment.fromString("red")
// from a hex color
Pigment.fromString("#ff0000")
// from a short hex color
Pigment.fromString("#f00")
// from a hex color with alpha
Pigment.fromString("#80ff0000")
// from an RGB color
Pigment.fromString("rgb(255,0,0)")
// from the CSSColor enum
Pigment.fromCSSColor(CSSColor.red)
```

## Demo

| Before | After |
|---|---|
| <img src="https://raw.githubusercontent.com/bregydoc/pigment/master/pigment_logo.png" width="250"> | <img src="https://raw.githubusercontent.com/bregydoc/pigment/master/pigment_use.png" width="250"> |

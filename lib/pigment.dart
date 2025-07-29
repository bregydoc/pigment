library pigment;

import 'dart:ui';
part 'named_colors.dart';

class Pigment extends Color {
  Pigment(int value) : super(value);

  static bool _hasCorrectHexPattern(String string) {
    return RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$')
        .hasMatch(string);
  }

  static Color? _getRGBColorFromString(String string) {
    string = string.replaceAll(" ", ""); // pseudo-trimming
    if (string.startsWith("rgb(") && string.endsWith(")")) {
      string = string.substring(4, string.length - 1);
      final rgb = string.split(",");
      if (rgb.length == 3) {
        final r = int.tryParse(rgb[0]);
        final g = int.tryParse(rgb[1]);
        final b = int.tryParse(rgb[2]);
        if (r != null && g != null && b != null) {
          return Color.fromARGB(255, r, g, b);
        }
      }
    }
    return null;
  }

  static Color _getColor(String color) {
    color = color.trim();

    final rgbColor = _getRGBColorFromString(color);
    if (rgbColor != null) {
      return rgbColor;
    }

    if (_hasCorrectHexPattern(color)) {
      var hex = color.replaceAll("#", "");
      if (hex.length == 3) {
        hex = hex.split('').map((c) => c + c).join('');
      }
      if (hex.length == 6) {
        hex = "FF$hex";
      }
      if (hex.length == 8) {
        hex = hex.substring(6, 8) + hex.substring(0, 6);
      }
      return Color(int.parse("0x$hex"));
    }

    final namedColor = cssColors[color.toLowerCase()];
    if (namedColor != null) {
      return _getColor(namedColor);
    }

    throw 'color pattern [$color] not found! D:';
  }

  static Color fromString(String color) {
    return _getColor(color);
  }

  static Color fromCSSColor(CSSColor color) {
    final colorName =
        color.toString().substring(color.toString().indexOf('.') + 1);
    return _getColor(colorName);
  }
}

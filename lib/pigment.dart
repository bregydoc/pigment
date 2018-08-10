library pigment;

import 'dart:ui';
part 'named_colors.dart';

class Pigment extends Color {
  @override
  Pigment(int value) : super(value);

  static bool _hasCorrectHexPattern(String string) {
    string = string.replaceAll("#", "");
    String validChars = "0123456789AaBbCcDdEeFf";
    for (int i = 0; i < string.length; i++) {
      if (!validChars.contains(string[i])) {
        return false;
      }
    }
    return true;
  }

  static Color _getRGBColorFromString(String string) {
    string = string.replaceAll(" ", ""); // pseudo-trimming
    if (string.startsWith("rgb(") && string.endsWith(")")) {
      // Correct
      string = string.replaceAll("rgb(", "");
      string = string.replaceAll(")", "");
      List<String> rgb = string.split(",");
      if (rgb.length == 3) {
        int r = int.parse(rgb[0]);
        int g = int.parse(rgb[1]);
        int b = int.parse(rgb[2]);
        return new Color.fromARGB(255, r, g, b);
      }
      return null;
    }
    return null;
  }

  static Color _getColor(String color) {
    color = color.trim();

    Color rgbColor = _getRGBColorFromString(color);
    if (rgbColor != null) {
      return rgbColor;
    }

    Color finalColor;
    if (_hasCorrectHexPattern(color)) {
      color = color.replaceAll("#", "");
      int size = color.length;
      if (size == 6 || size == 3) {
        if (size == 3) {
          color = color[0] + color[0] + color[1] + color[1] + color[2] + color[2];
        }

        int value = int.parse(color, radix: 16);
        value = value + 0xFF000000;
        finalColor = new Color(value);
      } else if (size == 8 || size == 4) {
        if (size == 4) {
          color =
              color[0] + color[0] + color[1] + color[1] + color[2] + color[2] + color[3] + color[3];
        }
        String alpha = color.substring(6);
        color = alpha + color.substring(0, 6);
        int value = int.parse(color, radix: 16);
        finalColor = new Color(value);
      }
    }

    if (finalColor != null) {
      return finalColor;
    }

    String namedColor = cssColors[color];
    if (namedColor != null && namedColor != "") {
      namedColor = namedColor.replaceAll("#", "");
      int value = int.parse(namedColor, radix: 16);
      value = value + 0xFF000000;
      return new Color(value);
    }

    throw 'color pattern [$color] not found! D:';
  }

  static Color fromString(String color) {
    return _getColor(color);
  }

  static Color fromCSSColor(CSSColor color) {
    String colorName = color.toString().substring(color.toString().indexOf('.') + 1);
    return _getColor(colorName);
  }
}

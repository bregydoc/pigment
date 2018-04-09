import 'dart:ui';

class Pigment extends Color {
  @override
  Pigment(int value) : super(value);

  static Color _getColor(String color) {
    if (color.startsWith("#")) {
      color = color.substring(1);
    }

    int size = color.length;

    if (size == 8) {
      String alpha = color.substring(6);
      color = alpha + color.substring(0, 6);
    }

    int value = int.parse(color, radix: 16);

    if (size == 6) {
      value = value + 0xFF000000;
    }

    if (size < 6) {
      throw ("Invalid color length");
    }
    // print(value.toRadixString(16));
    return new Color(value);
  }

  static Color fromString(String color) {
    return _getColor(color);
  }
}

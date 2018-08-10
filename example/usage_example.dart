import 'package:pigment/pigment.dart';
import 'package:flutter/material.dart';

void main() {
  LinearGradient g = new LinearGradient(
    colors: [
      Pigment.fromString("rgb(0, 225, 170)"),
      Pigment.fromString("rgb(27, 26, 64)"),
      Pigment.fromString("rgb(221, 64, 86)"),
      Pigment.fromString("#5442FE"),
      Pigment.fromString("#50E8D7"),
      Pigment.fromString("#FF3472"),
      Pigment.fromString("#a0227baa"),
      Pigment.fromString("#EFEFEF"),
      Pigment.fromString("#AEF"),
      Pigment.fromString("#01B9"),

      Pigment.fromCSSColor(CSSColor.rosybrown), // #BC8F8F
      Pigment.fromCSSColor(CSSColor.palegoldenrod), // #EEE8AA
      Pigment.fromString('lightsalmon'), // #FFA07A
      Pigment.fromString('deeppink'), // #FF1493
      new Pigment(0xFFAA23F2) // #AA23F2
    ],
  );
}

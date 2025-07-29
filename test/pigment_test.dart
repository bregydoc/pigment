import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pigment/pigment.dart';

void main() {
  test('Color parsing', () {
    expect(Pigment.fromString('#ff0000'), equals(Colors.red));
    expect(Pigment.fromString('#f00'), equals(Colors.red));
    expect(Pigment.fromString('rgb(255,0,0)'), equals(Colors.red));
    expect(Pigment.fromString('red'), equals(Colors.red));
  });

  test('Color parsing with alpha', () {
    expect(Pigment.fromString('#80ff0000'), equals(Colors.red.withAlpha(128)));
  });

  test('CSS colors', () {
    expect(Pigment.fromCSSColor(CSSColor.red), equals(Colors.red));
  });
}

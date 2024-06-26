import 'dart:math';

import 'package:gilded_rose/%20roman.dart';
import 'package:test/test.dart';

void main() {
  test('convert one number return I', () {
    final roman = RomanNumeralConverter.convert(1);
    expect(roman, 'I');
  });

  test('convert two number return I', () {
    final roman = RomanNumeralConverter.convert(2);
    expect(roman, 'II');
  });
  test('convert three number return III', () {
    final roman = RomanNumeralConverter.convert(3);
    expect(roman, 'III');
  });

  test('convert  ten return X', () {
    final roman = RomanNumeralConverter.convert(10);
    expect(roman, 'X');
  });

  test('convert 20 ten return XX', () {
    final roman = RomanNumeralConverter.convert(20);
    expect(roman, 'XX');
  });

  test('convert 30 ten return XXX', () {
    final roman = RomanNumeralConverter.convert(30);
    expect(roman, 'XXX');
  });

  test('convert 40 ten return XL', () {
    final roman = RomanNumeralConverter.convert(40);
    expect(roman, 'XL');
  });
}

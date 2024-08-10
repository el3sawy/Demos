final class RomanNumeralConverter {
  static var _romanMap = {
    1: 'I',
    2: 'II',
    3: 'III',
    4: 'IV',
    5: 'V',
    6: 'VI',
    7: 'VII',
    8: 'VIII',
    9: 'IX',
  };
  static String convert(int number) {
    if (number < 10) {
      return _romanNumeralLessThanTen(number);
    } else {
      return _romanNumeralMoreThanTen(number);
    }
  }

  static String _romanNumeralLessThanTen(int number) {
    return _romanMap[number] ?? '';
  }

  static String _romanNumeralMoreThanTen(int number) {
    final dived = number / 10;
    return _getNumberOFX(dived.toInt());
  }

  static String _getNumberOFX(int counter) {
    return List.generate(counter, (index) => 'X').join();
  }
}
/*

Convert a give positive number to its Roman numeral representation as a String.
For example:
final romanNumeral = RomanNumeralConverter.convert(1); // "I"
final romanNumeral = RomanNumeralConverter.convert(99); // "XCIX" (90 -> "XC" + 9 -> "IX")
final romanNumeral = RomanNumeralConverter.convert(47); // "XLVII" (40 -> "XL" + 7 -> "VII")
final romanNumeral = RomanNumeralConverter.convert(325); // "CCCXXV" (300 -> "CCC" + 20 -> "XX" + 5 -> "V")
The 'digits' are as follows:
One to nine

"I" -> 1
"II" -> 2
"III" -> 3

"IV" -> 4
"V" -> 5
"VI" -> 6
"VII" -> 7
"VIII" -> 8
"IX" -> 9
Multiples of ten

"X" -> 10 
"XX" -> 20
"XXX" -> 30

"XL" -> 40
"L" -> 50
"LX" -> 60
"LXX" -> 70
"LXXX" -> 80

"XC" -> 90
"C" -> 100
"CC" -> 200
"CCC" -> 300
"CD" -> 400
"D" -> 500
"DC" -> 600
"DCC" -> 700
"DCCC" -> 800
"CM" -> 900
*/
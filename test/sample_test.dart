import 'package:exercises/sample.dart';
import 'package:test/test.dart';

void main() {
  test('Hello World', () {
    expect(hello(), 'Hello World');
  });
  group('Resistor color test', () {
    test('Color Code Test', () {
      var c = Resistor();
      expect(c.getColorCode('red'), 2);
    });
    test('Resistor color Code Test', () {
      var c = Resistor();
      expect(c.rcolor('brown-green-red'), 15);
      expect(c.rcolor('brown-green'), 15);
    });
  });
  test('Concate Test', () {
    expect(twoFar(''), 'One for you, one for me.');
    expect(twoFar('siva'), 'One for siva, one for me.');
  });
  test('Reverse Test', () {
    expect(reverseText('text'), 'txet');
    expect(reverseText('cool'), 'looc');
  });
  test('LeapYear Test', () {
    expect(leapYear(1999), '1999 is not a leap year');
    expect(leapYear(2000), '2000 is leap year');
  });
  test('scrabbleScore Test', () {
    expect(scrabbleScore('cabbage'), 14);
    expect(scrabbleScore('aaa'), 3);
    expect(scrabbleScore('qz'), 20);
  });
}

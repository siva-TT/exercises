import 'dart:math';

//  #1. Hello World with Test-------------------
String hello() {
  return 'Hello World';
}

//  #2. Resistor Color Code-------------------
class Resistor {
  static List<String> colorCodes = [
    'black',
    'brown',
    'red',
    'orange',
    'yellow',
    'green',
    'blue',
    'violet',
    'grey',
    'white',
  ];

  int getColorCode(String color) {
    return colorCodes.indexOf(color.toLowerCase());
  }

//  #4. Resistor Duo-------------------
  rcolor(String color) {
    var c = color.toLowerCase().split('-');
    if (c.isEmpty) return 'Enter Color';

    var c1 = getColorCode(c[0]);
    var c2 = 0;
    if (c.length > 1) {
      c2 = getColorCode(c[1]);
    } else {
      return c1;
    }
    return c1 * 10 + c2;
  }
}

//  #3. Two for One-------------------
String twoFar(name) {
  // var name = stdin.readLineSync();
  if (name.toString().isEmpty) {
    name = 'you';
  }
  return 'One for ${name}, one for me.';
}

//  #5. Reverse String-------------------
String reverseText(String text) {
  return text.split('').reversed.join('');
}

//  #6. Leap Year-------------------
String leapYear(int year) {
  // var year = stdin.readLineSync();
  if (year % 4 == 0) {
    if (year % 100 == 0) {
      if (year % 400 == 0) {
        return '$year is leap year';
      } else {
        return '$year is not a leap year';
      }
    } else {
      return '$year is leap year';
    }
  } else {
    return '$year is not a leap year';
  }
}

//  #7. Scrabble Score-------------------
int scrabbleScore(String text) {
  const score = {
    'AEIOULNRST': 1,
    'DG': 2,
    'BCMP': 3,
    'FHVWY': 4,
    'K': 5,
    'JX': 8,
    'QZ': 10
  };
  var res = text
      .toUpperCase()
      .split('')
      .map((c) => score.entries.firstWhere((e) => e.key.contains(c)).value)
      .fold(0, (int pv, v) => pv + v);
  return res;
}

//  #8. Beer Strong-------------------
beerStrong() {
  for (int i = 9; i >= 0; i--) {
    var cbc = i.toString();
    var nbc = (i - 1).toString();
    if (i > 1) {
      print('$cbc bottles of beer on the wall, $cbc bottles of beer.');
      print(
          'Take one down and pass it around, $nbc bottles of beer on the wall.');
      print('');
    } else if (i == 1) {
      print('$cbc bottle of beer on the wall, $cbc bottle of beer.');
      print(
          'Take it down and pass it around, no more bottles of beer on the wall.');
      print('');
    } else if (i == 0) {
      print('No more bottles of beer on the wall, no more bottles of beer.');
      print(
          'Go to the store and buy some more, 99 bottles of beer on the wall.');
      print('');
    }
  }
}

//  #9. Armstrong Numbers-------------------
armstrongNum(int number) {
  String n = number.toString();

  var res = n
      .split('')
      .map((e) => pow(int.parse(e), n.length))
      .reduce((a, b) => a + b);
//   print(res);
  if (res == number) {
    print('$number is an Armstrong number,');
  } else {
    print('$number is not an Armstrong number,');
  }
}

//  #10. Isograms-------------------
isogram(String text) {
  var rs = text.replaceAll(RegExp('[ -]'), '');
  var value = rs.split('').toSet().join();
  if (value.length == rs.length) {
    print('The word $text is isograms');
  } else {
    print('The word $text is not a isograms');
  }
}

//  #11. Difference of Squares-------------------
differenceOfSquares(int number) {
  var n = List.generate(10, (i) => i + 1);
  print(n);
  var sqSum = pow(number * (number + 1) / 2, 2);
  print('The square of the sum of the first ten natural numbers is $sqSum');
  var sumSq = n.fold(0, (int pv, v) => pv + pow(v, 2).toInt());
  print('The sum of the squares of the first ten natural numbers is $sumSq');
  print(
      'The difference between the square of the sum of the first ten natural numbers and the sum of the squares of the first ten natural numbers is ${sqSum - sumSq}');
}

// #12. Word Count-------------------------------

wordCount() {
  String phrase =
      '''That's the password: 'PASSWORD 123'!', cried the Special Agent.\nSo I fled.''';

  phrase = phrase.toLowerCase();
  var matches = RegExp(r"(\d+|\w+'\w|\w+)").allMatches(phrase);
  var words = matches.map((e) => e[0] as String);
  var count = <String, int>{};
  words.forEach((e) {
    count[e] = count.containsKey(e) ? (count[e] as int) + 1 : 1;
  });
  return count;
}

// #13. Bob-----------------------------

bob(String greet) {
  greet = greet.trim();
  final containsLetter = greet.contains(RegExp(r'[a-zA-Z]+'));
  final isQuestion = greet.endsWith('?');
  final isShout = greet.toUpperCase() == greet && containsLetter;
  final isForcefulQuestion = isShout && isQuestion;
  final isSilent = greet.isEmpty;

  if (isForcefulQuestion) return "Calm down, I know what I'm doing!";
  if (isQuestion) return "Sure";
  if (isShout) return 'Whoa, chill out!';
  if (isSilent) return 'Fine. Be that way!';
  return 'Whatever.';
}

// #14. Space Age-------------------------
class SpaceAge {
  static const _secondInEarth = 31557699;
  static const _orbitalPeriods = {
    'mercury': 0.2408467,
    'Venus': 0.61519726,
    'Earth': 1,
    'Mars': 1.8808158,
    'Jupiter': 11.862615,
    'Saturn': 29.447498,
    'Uranus': 84.016846,
    'Neptune': 164.79132
  };
  age({required String planet, required int seconds}) {
    final age =
        seconds / (_secondInEarth * (_orbitalPeriods[planet] as double));
    return double.parse(age.toStringAsFixed(2));
  }
}

hamming(String sample) {
  // var strand1 = 'GAGCCTACTAACGGGAA';
  var strand1 = sample;
  var strand2 = 'CATCGTAATGACGGCCT';
  int pos = 0;
  var res = strand1
      .split('')
      .map((e) => strand2[pos++] == e ? 0 : 1)
      .fold(0, (var pv, v) => pv + v);
  print(res);
}

String acronym() {
  var phrase = 'Three Letter Acronyms';
  var res =
      phrase.split(' ').map((e) => e.isEmpty ? '' : e[0]).join().toUpperCase();
  print(res);
  return res;
}

phoneNumber() {
  var num = '+1 (613)-995-0253';
  var res = num.replaceAll(RegExp(r'[^\d]'), '');
  if (res.length > 10) {
    res = res.substring(res.length - 10);
  }
  print(res);
}

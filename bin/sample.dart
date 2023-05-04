import 'dart:io';

import 'package:exercises/sample.dart';

void main(List<String> arguments) {
  // reverseText('siva');
  // leapYear(1999);
  // scrabbleScore('sivakumar');
  armstrongNum(153);
  // ResistorIntegration();
}

// ignore: non_constant_identifier_names
void ResistorIntegration() {
  print('Enter color:');

  var color = stdin.readLineSync();
  if (color == null || color.isEmpty) {
    print('No color!');
  } else {
    // ignore: unused_local_variable
    var c = Resistor();
    print(c.getColorCode(color));
  }
}

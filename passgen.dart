import 'dart:io';
import 'dart:math';

const String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@#%^&*';
final Random _rnd = Random();

main() {
  print('Password Generator');
  print('Choose password strength: weak, medium, or strong');
  
  stdout.write('Enter your choice: ');
  String? strength = stdin.readLineSync()?.toLowerCase();

  passwordGenerator(strength ?? '');
}

void passwordGenerator(String strength) {
  int length;
  
  if (strength == 'weak') {
    length = 8;
  } else if (strength == 'medium') {
    length = 15;
  } else if (strength == 'strong') {
    length = 25;
  } else {
    print('Invalid option. Please choose from: weak, medium, or strong.');
    return;
  }
  
  String password = shuffleGenerator(length);
  print('Generated $strength password: $password');
}

String shuffleGenerator(int length) {
  return String.fromCharCodes(  
    Iterable.generate(
      length,
      (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
    ),
  );
}

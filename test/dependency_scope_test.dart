import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Calc testing',
    () {
      test(
        'Testing calc function 1',
        () {
          final num = calc(2, 2);
          expect(num, 4);
        },
      );
      test(
        'Testing calc function 2',
        () {
          final num = calc(3, 2);
          expect(num, 5);
        },
      );
      test(
        'Testing calc function 3',
        () {
          final num = calc(3, 3);
          expect(num, 6);
        },
      );
    },
  );
}

num calc(num a, num b) {
  return a + b;
}

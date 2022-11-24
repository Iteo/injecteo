import 'package:test/test.dart';

import '../utils/file_utils.dart';

void expectChecksumEquals(String first, String second) {
  final firstValue = generateMd5(first);
  final secondValue = generateMd5(second);

  expect(firstValue, secondValue);
}

void expectChecksumNotEquals(String first, String second) {
  final firstValue = generateMd5(first);
  final secondValue = generateMd5(second);

  expect(firstValue, isNot(secondValue));
}

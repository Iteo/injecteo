import 'package:test/test.dart';

import '../utils/file_utils.dart';

void expectChecksumEquals(String first, String second) {
  expect(generateMd5(first), generateMd5(second));
}

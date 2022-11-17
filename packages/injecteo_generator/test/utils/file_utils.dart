import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;

String readFile(List<String> parts) {
  final path = p.joinAll(parts);
  final file = File(path);
  return file.readAsStringSync();
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

import 'package:injecteo/src/exception/injecteo_error.dart';

class NotRegisteredInjecteoError extends InjecteoError {
  NotRegisteredInjecteoError(super.message);

  @override
  String toString() {
    return 'Not registered InjecteoError:\n$message\n';
  }
}

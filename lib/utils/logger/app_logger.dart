import 'package:flutter/foundation.dart';

class AppLogger {
  static const bool kDebug = kDebugMode;

  static void log(String message) {
    if (kDebug) {
      debugPrint(message);
    }
  }
}

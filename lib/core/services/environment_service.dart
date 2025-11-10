import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentService {

  static Future<void> ensureInitialized() async {
    await dotenv.load(fileName: EnvironmentService.fileName);
  }

  static String get fileName {
    if (kDebugMode) {
      return '.env.developer';
    }
    return '.env.master';
  }

  static String get apiBaseUrl {
    return dotenv.env['BASE_URL'] ?? '';
  }

  static String get clientKey {
    return dotenv.env['CLIENT_KEY'] ?? '';
  }

  static String get secretKey {
    return dotenv.env['SECRET_KEY'] ?? '';
  }
}

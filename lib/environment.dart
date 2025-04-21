import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Future<void> load() async {
    await dotenv.load(fileName: ".env");
  }

  static String get apiKey => dotenv.env['API_KEY_IMAGE_STORAGE'] ?? '';
}

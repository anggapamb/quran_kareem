import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static get baseUrl => dotenv.env['BASE_URL'];
  static get networkTimeout => const Duration(seconds: 60);
  static get lastRead => 'lastRead';
}

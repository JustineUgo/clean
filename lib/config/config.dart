import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static Future<void> init() async {
    log('INITITIALING ENVIRONMENT');
    if (kDebugMode) {
      await dotenv.load(fileName: ".env");
      return;
    }
    await dotenv.load(fileName: "prod.env");
  }
}

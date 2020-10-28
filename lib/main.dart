import 'package:flutter/material.dart';

import 'src/app.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(VitabuApp());
  } catch (error, stacktrace) {
    debugPrint('Main.Main ::: ERROR: $error & STACKTRACE: $stacktrace');
  }
}

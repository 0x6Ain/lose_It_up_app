import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lose_it_up_app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lose_it_up_app/injection.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      configureDependencies();
      await dotenv.load(fileName: ".env");

      // * Entry point of the app
      runApp(
        const ProviderScope(child: MyApp()),
      );
    },
    (error, stack) {
      //todo: error loging service
      if (kDebugMode) ('error : $error');
      if (kDebugMode) ('stack : $stack');
    },
  );
}

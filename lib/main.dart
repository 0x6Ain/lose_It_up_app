import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lose_it_up_app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  // * Entry point of the app
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

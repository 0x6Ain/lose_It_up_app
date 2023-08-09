import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:lose_it_up_app/localization/string_hardcoded.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  // * Entry point of the app
  runApp(
    const MaterialApp(home: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final env = dotenv.env['API_URL'];
    return Scaffold(
      body: Center(
        child: Text(env ?? 'unexpected'),
      ),
    );
  }
}

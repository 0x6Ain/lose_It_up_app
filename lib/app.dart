import 'package:flutter/material.dart';
import 'package:lose_it_up_app/routes/app_router.dart';
import 'package:lose_it_up_app/utils/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      // onGenerateTitle: (BuildContext context) => 'My Shop'.hardcoded,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(ThemeMode.system == ThemeMode.light ? 'light' : 'dark'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_location_sharp),
            onPressed: () {
              print(ThemeMode.system);
              setState(() {});
            },
          )
        ],
        // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Scrollbar(
        controller: _controller,
        thickness: 5, //width of scrollbar
        radius: const Radius.circular(10), //corner radius of scrollbar
        child: SingleChildScrollView(
          controller: _controller,
          child: Column(
            children: [
              const SizedBox(
                height: 300,
                child: Center(child: Text('Graph will be here')),
              ),
              Container(
                height: 600,
                color: Colors.redAccent,
                child: const Center(child: Text('Not Implemented')),
              ),
              Container(
                height: 600,
                color: Colors.yellowAccent,
                child: const Center(child: Text('Not Implemented')),
              ),
              Container(
                height: 600,
                color: Colors.orangeAccent,
                child: const Center(child: Text('Not Implemented')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

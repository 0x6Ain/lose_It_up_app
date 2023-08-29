import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lose_it_up_app/routes/app_router.dart';
import 'package:lose_it_up_app/utils/extension.dart';
import 'package:lose_it_up_app/utils/theme_state.dart';
import 'package:lose_it_up_app/utils/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateProvider);
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('ko'),
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      // onGenerateTitle: (BuildContext context) => 'My Shop'.hardcoded,
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: themeState,
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
    // 키보드 입력 비활성화
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.appTitle),
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        color: Colors.blue,
        edgeOffset: 40.0,
        onRefresh: () async {
          return;
        },
        child: Scrollbar(
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
                  color: Colors.amberAccent,
                  child: const SizedBox(
                    height: 600,
                    child: Center(child: Text('Not Implemented')),
                  ),
                ),
                Container(
                  color: Colors.black,
                  child: const SizedBox(
                    height: 600,
                    child: Center(child: Text('Not Implemented')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

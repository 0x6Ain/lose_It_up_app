import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lose_it_up_app/localization/string_hardcoded.dart';
import 'package:lose_it_up_app/utils/theme_state.dart';

class ScaffoldWithNavigationBar extends ConsumerWidget {
  const ScaffoldWithNavigationBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeState = ref.watch(themeStateProvider);
    return Scaffold(
      extendBody: true,
      body: body,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onDestinationSelected,
        selectedIndex: selectedIndex,
        indicatorColor: Colors.transparent,
        backgroundColor: themeState == ThemeMode.dark
            ? Colors.black.withOpacity(0.8)
            : Colors.white.withOpacity(0.8),
        destinations: [
          NavigationDestination(
            label: 'Home'.hardcoded,
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
          ),
          NavigationDestination(
            label: 'Upload'.hardcoded,
            icon: const Icon(Icons.publish_outlined),
            selectedIcon: const Icon(Icons.publish),
          ),
          NavigationDestination(
            label: 'Profile'.hardcoded,
            icon: const Icon(Icons.person_outline_outlined),
            selectedIcon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

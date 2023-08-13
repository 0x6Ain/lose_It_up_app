import 'package:flutter/material.dart';
import 'package:lose_it_up_app/localization/string_hardcoded.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: body,
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: onDestinationSelected,
        selectedIndex: selectedIndex,
        indicatorColor: Colors.transparent,
        //TODO: ThemeMode.system에 따른 backgroundcolor 변경
        // backgroundColor: ThemeMode.system != ThemeMode.light ? Colors.white : Colors.black,
        backgroundColor: Colors.white.withOpacity(0.8),
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

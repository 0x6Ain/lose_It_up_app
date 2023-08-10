import 'package:flutter/material.dart';
import 'package:lose_it_up_app/localization/string_hardcoded.dart';

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
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
      body: Row(
        children: [
          // Fixed navigation rail on the left (start)
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            indicatorColor: Colors.transparent,
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                label: Text('Home'.hardcoded),
                icon: const Icon(Icons.home_outlined),
                selectedIcon: const Icon(Icons.home),
              ),
              NavigationRailDestination(
                label: Text('Upload'.hardcoded),
                icon: const Icon(Icons.publish_outlined),
                selectedIcon: const Icon(Icons.publish),
              ),
              NavigationRailDestination(
                label: Text('Profile'.hardcoded),
                icon: const Icon(Icons.person_outlined),
                selectedIcon: const Icon(Icons.person),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Main content on the right (end)
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}

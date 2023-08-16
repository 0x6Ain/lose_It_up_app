import 'package:flutter/material.dart';

class ScrollEndListenerWidget extends StatelessWidget {
  const ScrollEndListenerWidget({
    super.key,
    required this.onReachToEnd,
    required this.isLoading,
    required this.child,
  });

  final VoidCallback onReachToEnd;
  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels == notification.metrics.maxScrollExtent) {
          onReachToEnd();
        }
        return true;
      },
      child: child,
    );
  }
}

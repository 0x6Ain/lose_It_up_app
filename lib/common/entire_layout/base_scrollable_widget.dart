import 'package:flutter/material.dart';

class ScrollableWidget extends StatefulWidget {
  const ScrollableWidget({super.key, required this.child});

  final Widget child;

  @override
  State<ScrollableWidget> createState() => _ScaffoldWithScrollableState();
}

class _ScaffoldWithScrollableState extends State<ScrollableWidget> {
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

  void _setScrollUp() {
    _controller.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      controller: _controller,
      child: SingleChildScrollView(
        controller: _controller,
        child: widget.child,
      ),
    );
  }
}

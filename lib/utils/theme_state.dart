import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_state.g.dart';

@riverpod
class ThemeState extends _$ThemeState {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void changeDarkMode(bool isOn) {
    state = isOn ? ThemeMode.dark : ThemeMode.light;
  }
}

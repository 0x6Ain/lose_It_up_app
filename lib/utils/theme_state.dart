import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_state.g.dart';

@riverpod
class ThemeState extends _$ThemeState {
  var _isOn = false;
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void changeMode() {
    _isOn = !_isOn;
    state = _isOn ? ThemeMode.dark : ThemeMode.light;
  }
}

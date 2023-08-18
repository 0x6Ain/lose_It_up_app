Future<void> delay(bool isDelay, {int milliseconds = 2000}) {
  if (isDelay) {
    return Future.delayed(Duration(milliseconds: milliseconds));
  } else {
    return Future.value();
  }
}

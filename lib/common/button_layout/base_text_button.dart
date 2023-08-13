import 'package:flutter/material.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';

class BaseTextButton extends StatelessWidget {
  const BaseTextButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.p48,
      decoration: BoxDecoration(
          color: onPressed == null ? Colors.grey : Theme.of(context).colorScheme.secondary,
          // color: Colors.purple,
          borderRadius: BorderRadius.circular(16.0)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

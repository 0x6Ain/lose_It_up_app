import 'package:flutter/material.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';

class BaseTextButton extends StatelessWidget {
  const BaseTextButton({
    super.key,
    required this.text,
    required this.isLoading,
    this.onPressed,
  });
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Sizes.p48,
      decoration: BoxDecoration(
          color: onPressed == null ? Colors.grey : Theme.of(context).colorScheme.background,
          // color: Colors.purple,
          borderRadius: BorderRadius.circular(100.0)),
      child: TextButton(
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
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

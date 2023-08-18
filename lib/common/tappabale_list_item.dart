// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';

class TappableListItem extends StatelessWidget {
  const TappableListItem({
    Key? key,
    required this.leadIcon,
    required this.leadText,
    this.rearText,
    this.rearIcon = Icons.keyboard_arrow_right_outlined,
    this.onPressed,
  }) : super(key: key);
  final IconData leadIcon;
  final String leadText;
  final String? rearText;
  final IconData? rearIcon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: SizedBox(
        width: double.infinity,
        height: 45.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  leadIcon,
                  size: 20,
                ),
              ),
              gapW12,
              Text(
                leadText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Spacer(),
              if (rearText != null)
                Text(
                  rearText!,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              gapW12,
              if (rearIcon != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    rearIcon,
                    size: 15,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

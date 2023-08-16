// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';

class SettingListItem extends StatelessWidget {
  const SettingListItem({
    Key? key,
    required this.icon,
    required this.text,
    this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.0,
      child: GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              gapW12,
              Expanded(
                  child: Text(
                text,
                style: Theme.of(context).textTheme.titleMedium,
              )),
            ],
          ),
        ),
      ),
    );
  }
}

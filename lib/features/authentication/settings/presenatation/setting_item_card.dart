// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SettingItemCard extends StatefulWidget {
  const SettingItemCard({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final bool isSelected;
  final Function(bool) onPressed;

  @override
  State<SettingItemCard> createState() => _SettingItemCardState();
}

class _SettingItemCardState extends State<SettingItemCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                child: Text(
              widget.text,
              style: Theme.of(context).textTheme.titleLarge,
            )),
            Switch(
              value: widget.isSelected,
              onChanged: (value) {
                widget.onPressed(value);
                // isSelected = !isSelected;
              },
            )
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lose_it_up_app/constants/app_sizes.dart';

class BaseIconTextButton extends StatelessWidget {
  const BaseIconTextButton({
    Key? key,
    required this.text,
    required this.icon,
    this.style,
    this.onPressed,
  }) : super(key: key);
  final String text;
  final String icon;
  final TextStyle? style;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    //create Container with border color black and background color transparent
    return Container(
      width: double.infinity,
      height: Sizes.p48,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: Colors.black),
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: style,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                icon,
                width: 46.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lose_it_up_app/common/button_layout/base_text_button.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';

//TODO: Add list of supplements feature , check feature of today
class UploadSupplementeSection extends StatelessWidget {
  const UploadSupplementeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        gapH20,
        const Text('My supplements'),
        const Spacer(),
        BaseTextButton(
          text: 'Upload supplements',
          isLoading: false,
          onPressed: () {},
        ),
      ],
    );
  }
}

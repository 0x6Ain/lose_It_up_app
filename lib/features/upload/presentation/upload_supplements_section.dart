import 'package:flutter/material.dart';
import 'package:lose_it_up_app/common/button_layout/base_text_button.dart';

//TODO: Add list of supplements feature , check feature of today
class UploadSupplementeSection extends StatelessWidget {
  const UploadSupplementeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('My supplements'),
        BaseTextButton(
          text: 'Upload supplements',
          isLoading: false,
          onPressed: () {},
        ),
      ],
    );
  }
}

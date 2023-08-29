import 'package:flutter/material.dart';
import 'package:lose_it_up_app/common/button_layout/base_text_button.dart';

//TODO: Upload DB, animation that filled water background
class UploadWaterSection extends StatefulWidget {
  const UploadWaterSection({super.key, drinkWaterLevel});

  @override
  State<UploadWaterSection> createState() => _UploadWaterSectionState();
}

class _UploadWaterSectionState extends State<UploadWaterSection> {
  double drinkWaterLevel = 0.0;

  _setWaterLevelUp() {
    setState(() {
      drinkWaterLevel += 0.25;
    });
  }

  _setWaterLevelDown() {
    setState(() {
      drinkWaterLevel -= 0.25;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Today drink water level'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _setWaterLevelDown,
                icon: const Icon(Icons.remove_circle_outline_outlined),
              ),
              Text('${drinkWaterLevel.toStringAsFixed(2)} L'),
              IconButton(
                onPressed: _setWaterLevelUp,
                icon: const Icon(Icons.add_circle_outline_outlined),
              ),
            ],
          ),
          BaseTextButton(
            text: 'Upload level',
            isLoading: false,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

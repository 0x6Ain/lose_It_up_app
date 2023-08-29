import 'package:flutter/material.dart';
import 'package:lose_it_up_app/features/upload/presentation/upload_meal_card.dart';

//TODO : Upload DB, Show list of uploaded list
class UploadMealSection extends StatefulWidget {
  const UploadMealSection({super.key});

  @override
  State<UploadMealSection> createState() => _UploadMealSectionState();
}

class _UploadMealSectionState extends State<UploadMealSection> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: MealSlot.values.length,
              onPageChanged: (value) {
                setState(() {
                  _currentIndex = value;
                });
              },
              itemBuilder: (context, index) {
                return UploadMealCard(
                  mealTime: MealSlot.values[index],
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Row(children: _buildIndicator())],
            ),
          )
        ],
      ),
    );
  }

  _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 50 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey.shade500,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 4; i++) {
      if (_currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}

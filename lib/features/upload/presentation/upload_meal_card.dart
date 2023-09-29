import 'package:flutter/material.dart';
import 'package:lose_it_up_app/features/meals/presentation/meal_search_delegate.dart';
import 'package:lose_it_up_app/utils/extension.dart';

enum MealSlot {
  breakfast,
  lunch,
  dinner,
  midnight;

  IconData get icon {
    switch (this) {
      case MealSlot.breakfast:
        return Icons.wb_sunny_outlined;
      case MealSlot.lunch:
        return Icons.brightness_5_outlined;
      case MealSlot.dinner:
        return Icons.nightlight_outlined;
      case MealSlot.midnight:
        return Icons.nights_stay_outlined;
    }
  }
}

class UploadMealCard extends StatelessWidget {
  const UploadMealCard({super.key, required this.mealTime});
  final MealSlot mealTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 300,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Icon(mealTime.icon),
                      Text(mealTime.name.toUpperCase()),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: MealSearchDelegate());
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 50,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox.adaptive(value: false, onChanged: (value) {}),
                  Text('Not eaten'.hardcoded),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

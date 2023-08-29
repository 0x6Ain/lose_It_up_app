import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lose_it_up_app/common/button_layout/base_text_button.dart';

//TODO: Upload DB
class UploadWaterSection extends StatefulWidget {
  const UploadWaterSection({super.key});

  @override
  State<UploadWaterSection> createState() => _UploadWaterSectionState();
}

class _UploadWaterSectionState extends State<UploadWaterSection> with TickerProviderStateMixin {
  late AnimationController _animationController;

  double goalOfWaterLevel = 2.0;
  double currentDrinkWaterLevel = 0.0;
  late double currentHeightOfWater;
  final double maxHeight = 500;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    currentHeightOfWater = 0;

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _setWaterLevelUp() {
    setState(() {
      _animationController.reset();
      _animationController.forward();
      currentDrinkWaterLevel += 0.25;
      if (currentHeightOfWater < maxHeight) {
        currentHeightOfWater = maxHeight / (goalOfWaterLevel / currentDrinkWaterLevel);
      }
    });
  }

  _setWaterLevelDown() {
    setState(() {
      if (currentDrinkWaterLevel > 0.00) {
        currentDrinkWaterLevel -= 0.25;
        _animationController.reset();
        _animationController.forward();
      }
      if (currentHeightOfWater > 0) {
        currentHeightOfWater = maxHeight / (goalOfWaterLevel / currentDrinkWaterLevel);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: AnimatedBuilder(
            animation: Listenable.merge([_animationController]),
            builder: (BuildContext context, Widget? child) {
              return AnimatedWave(
                animation: _animationController,
                height: currentHeightOfWater,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Today drink water level'),
              Text('Your Goal level : ${goalOfWaterLevel.toStringAsFixed(2)} L'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _setWaterLevelDown,
                    icon: const Icon(Icons.remove_circle_outline_outlined),
                  ),
                  Text('${currentDrinkWaterLevel.toStringAsFixed(2)} L'),
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
        ),
      ],
    );
  }
}

class AnimatedWave extends StatelessWidget {
  const AnimatedWave({super.key, required this.animation, required this.height});
  final Animation<double> animation;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, height),
      painter: CurvePainter(animation),
    );
  }
}

class CurvePainter extends CustomPainter {
  CurvePainter(this.animation);

  final Animation<double> animation;

  @override
  void paint(Canvas canvas, Size size) {
    final blue = Paint()..color = Colors.blue.withAlpha(60);
    final path = Path();
    final value = animation.value * 2 * pi;

    final y1 = sin(value);
    final y2 = sin(value + pi / 2);
    final y3 = sin(value + pi);

    final startPointY = size.height * (0.5 + 0.4 * y1);
    final controlPointY = size.height * (0.5 + 0.4 * y2);
    final endPointY = size.height * (0.5 + 0.4 * y3);

    path.moveTo(size.width * 0, startPointY);
    path.quadraticBezierTo(size.width * 0.5, controlPointY, size.width, endPointY);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, blue);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

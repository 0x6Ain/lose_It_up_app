import 'package:flutter/material.dart';
import 'package:lose_it_up_app/features/upload/presentation/upload_meal_section.dart';
import 'package:lose_it_up_app/features/upload/presentation/upload_supplements_section.dart';
import 'package:lose_it_up_app/features/upload/presentation/upload_water_section.dart';
import 'package:lose_it_up_app/utils/extension.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Upload'.hardcoded),
          bottom: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.dining_outlined)),
              Tab(icon: Icon(Icons.water_drop_outlined)),
              Tab(icon: Icon(Icons.medication_liquid_sharp)),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            UploadMealSection(),
            UploadWaterSection(),
            UploadSupplementeSection(),
          ],
        ));
  }
}

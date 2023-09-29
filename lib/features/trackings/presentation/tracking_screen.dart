import 'package:flutter/material.dart';
import 'package:lose_it_up_app/features/trackings/presentation/tracking_daily_section.dart';
import 'package:lose_it_up_app/features/trackings/presentation/tracking_monthly_section%20copy.dart';
import 'package:lose_it_up_app/features/trackings/presentation/tracking_today_section.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({super.key});

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> with TickerProviderStateMixin {
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
      //TODO: Add Calender widget when tap
      appBar: AppBar(title: const Text('Tracking')),
      body: Column(
        children: [
          SizedBox(
            height: 45,
            child: TabBar(
              padding: const EdgeInsets.only(right: 100),
              controller: _tabController,
              tabs: const [Text('기록'), Text('통계'), Text('식단 상세')],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TrackingTodaySection(),
                TrackingDailySection(),
                TrackingMonthlySection()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

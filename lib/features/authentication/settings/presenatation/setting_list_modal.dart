import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/common/alert_dialogs.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';
import 'package:lose_it_up_app/common/tappabale_list_item.dart';
import 'package:lose_it_up_app/routes/app_router.dart';

class SettingListModal extends StatelessWidget {
  const SettingListModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            gapH32,
            const Text('개인 정보'),
            TappableListItem(
              leadIcon: Icons.settings_accessibility_outlined,
              leadText: '계정 설정',
              onPressed: () => context.pop(AppRoute.account),
            ),
            const Divider(),
            const Text('설정'),
            TappableListItem(
              leadIcon: Icons.monitor_heart_outlined,
              leadText: '건강 연동',
              onPressed: () => showNotImplementedAlertDialog(context: context),
            ),
            TappableListItem(
              leadIcon: Icons.check,
              leadText: '단위',
              onPressed: () => showNotImplementedAlertDialog(context: context),
            ),
            const Divider(),
            const Text('서비스'),
            TappableListItem(
              leadIcon: Icons.campaign_outlined,
              leadText: '공지사항',
              onPressed: () => showNotImplementedAlertDialog(context: context),
            ),
            TappableListItem(
              leadIcon: Icons.star_border_outlined,
              leadText: '이벤트',
              onPressed: () => showNotImplementedAlertDialog(context: context),
            ),
            TappableListItem(
              leadIcon: Icons.file_copy_outlined,
              leadText: '개인정보 처리 방침',
              onPressed: () => showNotImplementedAlertDialog(context: context),
            ),
            TappableListItem(
              leadIcon: Icons.info_outlined,
              leadText: '버전 정보',
              onPressed: () => showNotImplementedAlertDialog(context: context),
            ),
            gapH64,
          ],
        ),
      ),
    );
  }
}

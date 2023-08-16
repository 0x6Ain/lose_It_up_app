import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';
import 'package:lose_it_up_app/features/authentication/settings/presenatation/setting_list_item.dart';
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
            SettingListItem(
              icon: Icons.settings_accessibility_outlined,
              text: '계정 설정',
              onPressed: () => context.pop(AppRoute.setting),
            ),
            const Divider(),
            const Text('설정'),
            SettingListItem(
                icon: Icons.monitor_heart_outlined,
                text: '건강 연동',
                onPressed: () {
                  print('건강연동!');
                }),
            const SettingListItem(
              icon: Icons.check,
              text: '단위',
            ),
            const Divider(),
            const Text('서비스'),
            const SettingListItem(
              icon: Icons.campaign_outlined,
              text: '공지사항',
            ),
            const SettingListItem(
              icon: Icons.star_border_outlined,
              text: '이벤트',
            ),
            const SettingListItem(
              icon: Icons.file_copy_outlined,
              text: '개인정보 처리 방침',
            ),
            const SettingListItem(
              icon: Icons.info_outlined,
              text: '버전 정보',
            ),
            gapH64,
          ],
        ),
      ),
    );
  }
}

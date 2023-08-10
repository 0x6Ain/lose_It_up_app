import 'package:flutter/material.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';
import 'package:lose_it_up_app/constants/dummy_data.dart';

import 'package:lose_it_up_app/localization/string_hardcoded.dart';

class UserAccountWidget extends StatelessWidget {
  const UserAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = kUser[0];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTapUp: (_) {
                        //TODO: Add function of picture
                        print('take a photo');
                      },
                      child: Stack(
                        fit: StackFit.passthrough,
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            foregroundImage: user.image != null ? NetworkImage(user.image!) : null,
                          ),
                          const Icon(
                            Icons.add_circle,
                            color: Colors.blue,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    Text(user.name),
                  ],
                ),
                gapW32,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(user.posts.toString()),
                    Text('posts'.hardcoded),
                  ],
                ),
                gapW16,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(user.follower.toString()),
                    Text('follower'.hardcoded),
                  ],
                ),
                gapW16,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(user.following.toString()),
                    Text('following'.hardcoded),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'Introduction'.hardcoded,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            user.introduction ?? 'No contents yet',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lose_it_up_app/constants/app_sizes.dart';
import 'package:lose_it_up_app/features/authentication/domain/user.dart';
import 'package:lose_it_up_app/utils/extension.dart';

import 'package:lose_it_up_app/routes/app_router.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: user == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  SizedBox(
                      height: 160,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.transparent,
                            foregroundImage: AssetImage('assets/muscle.png'),
                          ),
                          TextButton(
                            onPressed: () => context.goNamed(AppRoute.signIn.name),
                            child: const Text('Please sign in'),
                          ),
                        ],
                      ))
                ])
          : Column(
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
                                  foregroundImage:
                                      user!.image != null ? NetworkImage(user!.image!) : null,
                                ),
                                const Icon(
                                  Icons.add_circle,
                                  color: Colors.blue,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                          Text(user!.name ?? 'user!-${user!.uid}'),
                        ],
                      ),
                      gapW32,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(user!.posts.toString()),
                          Text('posts'.hardcoded),
                        ],
                      ),
                      gapW16,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(user!.follower.toString()),
                          Text('follower'.hardcoded),
                        ],
                      ),
                      gapW16,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(user!.following.toString()),
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
                  user!.introduction ?? 'No contents yet',
                  style: Theme.of(context).textTheme.bodyMedium,
                )
              ],
            ),
    );
  }
}

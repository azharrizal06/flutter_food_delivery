import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const ProfileHeader(),
          const SpaceHeight(10.0),
          const Text(
            'Oliver Sykes',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          const Text(
            'bahri@jagoflutter.id | 0812-3456-7891',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primary,
            ),
          ),
          const SpaceHeight(30.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: AppColors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: Assets.icons.myAccountCircle.svg(),
                    title: const Text('My Account'),
                    subtitle: const Text('Make changes to your account'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Assets.icons.logoutCircle.svg(),
                    title: const Text('Log out'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Assets.icons.helpAndSupportCircle.svg(),
                    title: const Text('Help & Support'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Assets.icons.aboutAppCircle.svg(),
                    title: const Text('About App'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          const SpaceHeight(30.0),
        ],
      ),
    );
  }
}

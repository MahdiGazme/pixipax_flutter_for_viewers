import 'package:flutter/material.dart';

import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/job_pages_app_bar_location_widget.dart';
import '../../../../shared/widget/milky_avatar_selector.dart';

class JobListPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  final void Function() onNotificationsTap;
  final String location;

  const JobListPageAppBar({
    required this.onNotificationsTap,
    required this.location,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
    super.key,
  });

  @override
  Widget build(final BuildContext context) => AppBar(
        leadingWidth: utils.smallAvatarSize + (utils.smallSpace * 2),
        leading: _avatar(),
        actions: [
          _notification(),
        ],
        title: JobPagesAppBarLocationWidget(
          location: location,
        ),
      );

  Widget _avatar() => CustomAvatarSelector(
        src:
            'https://marketplace.canva.com/EAFOWUXOOvs/1/0/800w/canva-green-gradient-minimalist-simple-instagram-profile-picture-ZtCfUoGJtSw.jpg',
        size: 45,
      );

  IconButton _notification() => IconButton(
        onPressed: onNotificationsTap,
        padding: EdgeInsets.zero,
        icon: const Icon(
          Icons.notifications_none_rounded,
        ),
      );
}

import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int index) onTap;

  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: utils.navigationBarSpace,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          selectedItemColor: customTheme.textColor,
          unselectedItemColor: customTheme.textColor.shade400,
          onTap: onTap,
          items: [
            _account(),
            _jobs(),
            _balance(),
          ],
        ),
      );

  BottomNavigationBarItem _account() => const BottomNavigationBarItem(
        icon: Icon(
          Icons.person_outline_rounded,
        ),
        label: 'Account',
      );

  BottomNavigationBarItem _jobs() => const BottomNavigationBarItem(
        icon: Icon(
          Icons.search_rounded,
        ),
        label: 'Jobs',
      );

  BottomNavigationBarItem _balance() => const BottomNavigationBarItem(
        icon: Icon(
          Icons.work_outline_rounded,
        ),
        label: 'Balance',
      );
}

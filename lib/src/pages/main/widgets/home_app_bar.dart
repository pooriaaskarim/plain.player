import 'package:pood/src/infrastructure/utils/app_utils.dart';
import 'package:flutter/material.dart';

import '../../../infrastructure/routes/route_names.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        PopupMenuButton(
            onSelected: (_) => Navigator.pop(context),
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: MaterialButton(
                        child: const Text('Settings'),
                        onPressed: () => Navigator.popAndPushNamed(
                            context, AppRouteNames.settingsPage)),
                  ),
                  PopupMenuItem(
                    child: MaterialButton(
                        child: const Text('Unknown'),
                        onPressed: () => Navigator.popAndPushNamed(
                            context, AppRouteNames.unknownPage)),
                  ),
                ])
      ],
      title: const Text(
        'Home',
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppUtils.xLargeSize);
}

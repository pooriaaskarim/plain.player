import 'package:flutter/material.dart';

import '../../infrastructure/utils/app.sizes.dart';

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Unknown',
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.all(AppSizes.points_4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.info,
                size: AppSizes.points_32 * 2,
              ),
              Text(
                'Nothing Here!',
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
        ),
      );
}

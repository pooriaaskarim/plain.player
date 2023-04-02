import 'package:flutter/material.dart';

import '../../infrastructure/utils/app.utils.dart';

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
          margin: const EdgeInsetsDirectional.all(AppUtils.size_4Pt),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.info,
                size: AppUtils.size_32Pt * 2,
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

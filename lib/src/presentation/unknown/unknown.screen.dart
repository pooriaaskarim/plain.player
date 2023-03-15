import 'package:flutter/material.dart';

import '../../infrastructure/utils/app_utils.dart';

class UnknownScreen extends StatefulWidget {
  const UnknownScreen({super.key});

  @override
  State<UnknownScreen> createState() => _UnknownScreenState();
}

class _UnknownScreenState extends State<UnknownScreen> {
  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Unknown',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.all(AppUtils.tinySize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.info,
                size: AppUtils.xLargeSize * 2,
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

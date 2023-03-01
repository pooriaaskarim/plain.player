import 'package:flutter/material.dart';

import '../../../infrastructure/utils/app_utils.dart';

class Unknown extends StatefulWidget {
  const Unknown({super.key});

  @override
  State<Unknown> createState() => _UnknownState();
}

class _UnknownState extends State<Unknown> {
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
